import 'dart:io';
import 'dart:typed_data';

import 'package:admin/ADMIN_DOMAIN/core/upload_failure.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/resource/resource_repository.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_add/widget/resource_form.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/object_utils.dart';
part 'add_resource_form_notifier.freezed.dart';

@freezed
class AddResourceFormData with _$AddResourceFormData {
  const factory AddResourceFormData({
    required Resource resource,
    required ResourceMainCategory category,
    required File? fileMOBILE, // Fichier à upload Mobile
    required Uint8List? fileWEB, // Fichier à upload WEB
    required String? nameFile,
    required Stream<TaskSnapshot>? uploadFileProgression,
    required XFile? image,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ResourceFailure, UniqueId>> failureOrSuccessOption,
  }) = _AddResourceFormData;

  factory AddResourceFormData.initial() => AddResourceFormData(
      resource: Resource.empty(),
      category: ResourceMainCategory.mediatheque,
      fileMOBILE: null,
      fileWEB: null,
      nameFile: null,
      image: null,
      showErrorMessages: false,
      uploadFileProgression: null,
      isSubmitting: false,
      failureOrSuccessOption: none());
}

class ResourceFormNotifier extends StateNotifier<AddResourceFormData> {
  final IResourceRepository _iResourceRepository;

  ResourceFormNotifier(this._iResourceRepository) : super(AddResourceFormData.initial());

  //Prend le nom du fichier ajouté
  nomChanged(String param) {
    state =
        state.copyWith(resource: state.resource.copyWith(nom: Nom(param)), failureOrSuccessOption: none());
  }

  descriptionChanged(String param) {
    state = state.copyWith(
        resource: state.resource.copyWith(description: (param)), failureOrSuccessOption: none());
  }

  shortDescriptionChanged(String param) {
    state = state.copyWith(
        resource: state.resource.copyWith(shortDescription: (param)), failureOrSuccessOption: none());
  }

  imageChanged(XFile param) {
    state = state.copyWith(
      image: param,
      resource: state.resource.copyWith(image: param.name),
      failureOrSuccessOption: none(),
    );
  }

  keywordChanged(String param) {
    state = state.copyWith(
        resource: state.resource.copyWith(keyword: param.split('/')), failureOrSuccessOption: none());
  }

  typeChanged(ResourceType param) {
    state = state.copyWith(resource: state.resource.copyWith(type: param), failureOrSuccessOption: none());
  }

  categoryChanged(ResourceMainCategory param) {
    state = state.copyWith(
        category: param,
        resource: state.resource.copyWith(mainCategory: param),
        failureOrSuccessOption: none());
  }

  fileMOBILEchanged(File file, String nameFile) {
    state = state.copyWith(
        fileMOBILE: file,
        nameFile: nameFile,
        //resource: state.resource.copyWith(documentPath: file.path),
        failureOrSuccessOption: none());
  }

  fileWEBchanged(Uint8List file, String nameFile) {
    state = state.copyWith(fileWEB: file, nameFile: nameFile, failureOrSuccessOption: none());
  }
  //insert-changed

  addResourcePressed() async {
    Either<ResourceFailure, UniqueId>? failureOrSuccess;

    state = state.copyWith(isSubmitting: true, failureOrSuccessOption: none());
    Either<UploadFailure, Stream<TaskSnapshot>>? resultUpload;

    // Chemin du fichier
    String pathFile = '${state.category.nameFile}/${state.nameFile!}';
    state = state.copyWith(
      resource: state.resource.copyWith(documentPath: pathFile),
    );

    // Upload du FICHIER
    if (state.nameFile != null) {
      final String? contentType = state.nameFile!.endsWith('.pdf') ? 'application/pdf' : null;
      if (kIsWeb) {
        if (state.fileWEB != null) {
          resultUpload = _iResourceRepository.uploadFileBytes(state.fileWEB!, pathFile, contentType);
        }
      } else {
        if (state.fileMOBILE != null) {
          resultUpload = _iResourceRepository.uploadFile(state.fileMOBILE!, pathFile, contentType);
        }
      }

      resultUpload?.fold((l) => null, (stream) => state = state.copyWith(uploadFileProgression: stream));
    }

    // Upload de l'IMAGE
    Either<UploadFailure, Unit>? resultUploadImage;
    if (state.image != null) {
      resultUploadImage = await _iResourceRepository.uploadImage(state.image!, state.resource.mainCategory);
    }

    if (resultUpload?.isRight() == true) {
      failureOrSuccess =
          await this._iResourceRepository.create(state.resource.copyWith(documentPath: pathFile));

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(resource: Resource.empty());
      }
    } else {
      failureOrSuccess = left(const ResourceFailure.unableToLoadFile());
    }

    //Calcul le chargment du fichier lourd, lorsqu'il est terminé, on met à jour le state
    resultUpload?.fold((l) => null, (stream) {
      stream.listen((event) {
        if ((event.bytesTransferred / event.totalBytes).asDouble > 0.99) {
          state = state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              failureOrSuccessOption: failureOrSuccess != null
                  ? some(failureOrSuccess)
                  : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
        }
      });
    });
  }
}
