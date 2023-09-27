import 'dart:io';

import 'package:admin/ADMIN_DOMAIN/core/upload_failure.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/resource/resource_repository.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_add/widget/resource_form.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
part 'add_resource_form_notifier.freezed.dart';

@freezed
class AddResourceFormData with _$AddResourceFormData {
  const factory AddResourceFormData({
    required Resource resource,
    required ResourceCategory category,
    required File? file,
    required String? nameFile,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ResourceFailure, UniqueId>> failureOrSuccessOption,
  }) = _AddResourceFormData;

  factory AddResourceFormData.initial() => AddResourceFormData(
      resource: Resource.empty(),
      category: ResourceCategory.mediatheque,
      file: null,
      nameFile: null,
      showErrorMessages: false,
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

  keywordChanged(String param) {
    state = state.copyWith(
        resource: state.resource.copyWith(keyword: param.split('/')), failureOrSuccessOption: none());
  }

  typeChanged(ResourceType param) {
    state = state.copyWith(resource: state.resource.copyWith(type: param), failureOrSuccessOption: none());
  }

  categoryChanged(ResourceCategory param) {
    state = state.copyWith(category: param, failureOrSuccessOption: none());
  }

  fileChanged(File file, String nameFile) {
    nomChanged(nameFile);
    state = state.copyWith(
        file: file,
        nameFile: nameFile,
        resource: state.resource.copyWith(documentPath: file.path),
        failureOrSuccessOption: none());
  }
  //insert-changed

  addResourcePressed() async {
    Either<ResourceFailure, UniqueId>? failureOrSuccess;

    //insert-valid-params

    state = state.copyWith(isSubmitting: true, failureOrSuccessOption: none());
    Either<UploadFailure, Unit>? resultUpload;

    String pathFile = '${state.category.nameFile}/${state.nameFile!}';

    // Upload de l'image
    if (state.file != null && state.nameFile != null) {
      resultUpload = await this._iResourceRepository.uploadFile(state.file!, pathFile);
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

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        failureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
