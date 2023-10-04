import 'dart:io';

import 'package:admin/ADMIN_APPLICATION/resource/add_resource_form_notifier.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

enum ResourceCategory { mediatheque, notice_constructeur, pieces_et_fournisseurs }

extension ResourceCategoryExtension on ResourceCategory {
  String get name {
    switch (this) {
      case ResourceCategory.mediatheque:
        return "Médiathèque";
      case ResourceCategory.notice_constructeur:
        return "Notice Constructeur";
      case ResourceCategory.pieces_et_fournisseurs:
        return "Pièces et Fournisseurs";
      default:
        return "Médiathèque";
    }
  }

  String get nameFile {
    switch (this) {
      case ResourceCategory.mediatheque:
        return "mediatheque";
      case ResourceCategory.notice_constructeur:
        return "notice_constructeur";
      case ResourceCategory.pieces_et_fournisseurs:
        return "pieces_et_fournisseurs";
      default:
        return "mediatheque";
    }
  }

  AppCategory get category {
    switch (this) {
      case ResourceCategory.mediatheque:
        return AppCategory(
            id: UniqueId.fromUniqueString('mediatheque'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/mediatheque',
            listResource: null);
      case ResourceCategory.notice_constructeur:
        return AppCategory(
            id: UniqueId.fromUniqueString('notice_constructeur'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/notice_constructeur',
            listResource: null);
      case ResourceCategory.pieces_et_fournisseurs:
        return AppCategory(
            id: UniqueId.fromUniqueString('pieces_et_fournisseurs'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/pieces_et_fournisseurs',
            listResource: null);
      default:
        return AppCategory(
            id: UniqueId.fromUniqueString('mediatheque'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/mediatheque',
            listResource: null);
    }
  }
}

class ResourceFormProvider extends ConsumerWidget {
  const ResourceFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddResourceFormData>(resourceFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                  duration: const Duration(seconds: 3),
                  icon: const Icon(Icons.warning),
                  messageColor: Colors.red,
                  message: failure.map(
                    insufficientPermission: (_) => "Permission Insuffisante",
                    unableToUpdate: (_) => "Unable to update",
                    unexpected: (_) => "Unexpected",
                    unableToLoadFile: (_) => "Unable to load file",
                    notExist: (_) => "Not Exist",
                  ),
                ).show(context);
              }, (UniqueId idResource) {
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  try {
                    context.router.popAndPush(Choice_categoryRoute(
                        idResource: idResource,
                        category: myRegisterState.category.category,
                        canChoiceCategory: false));
                  } catch (e, trace) {
                    print(e);
                    print(trace);
                  }
                });
              }));
    });
    return ResourceForm();
  }
}

class ResourceForm extends ConsumerWidget {
  const ResourceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AddResourceFormData resourceFormData = ref.watch(resourceFormNotifierProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
          const SizedBox(height: 8),
          //insert-field-complete
          SpaceH10(),
          Text(resourceFormData.nameFile ?? "",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          SpaceH10(),
          ElevatedButton(
              onPressed: () async {
                try {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    ref.read(resourceFormNotifierProvider.notifier).nomChanged(result.files.single.name);
                    File file = File(result.files.single.path!);
                    ref
                        .read(resourceFormNotifierProvider.notifier)
                        .fileChanged(file, result.files.single.name);
                  } else {
                    // User canceled the picker
                    showSnackBar(context, 'Pas de fichier sélectionnée');
                  }
                } catch (e, trace) {
                  showSnackBar(context, 'Erreur lors de la sélection de l\'image : $e');
                  print(e);
                  print(trace);
                }
              },
              child: const Text("Ajouter un Fichier")),

          SpaceH20(),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            autocorrect: false,
            minLines: 5,
            maxLines: 200,
            onChanged: (value) {
              ref.read(resourceFormNotifierProvider.notifier).descriptionChanged(value);
            },
            validator: (_) {
              return null;
            },
          ),
          SpaceH20(),
          Text("Séparez les mots clés par des /. Exemple : kw1/kw2/kw3",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          SizedBox(height: 3),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Keyword'),
            autocorrect: false,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              ref.read(resourceFormNotifierProvider.notifier).keywordChanged(value);
            },
            validator: (_) {
              return null;
            },
          ),
          const SpaceH10(),
          DropdownButton(
              isExpanded: true,
              value: resourceFormData.resource.type,
              dropdownColor: Colors.black,
              focusColor: Colors.black,
              iconEnabledColor: Colors.white,
              items: ResourceType.values
                  .map((ResourceType e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              onChanged: (ResourceType? value) {
                if (value != null) ref.read(resourceFormNotifierProvider.notifier).typeChanged(value);
              },
              icon: Icon(Icons.arrow_downward)),
          const SpaceH10(),
          DropdownButton(
              isExpanded: true,
              value: resourceFormData.category,
              dropdownColor: Colors.black,
              focusColor: Colors.black,
              iconEnabledColor: Colors.white,
              items: ResourceCategory.values
                  .map((ResourceCategory e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (ResourceCategory? value) {
                if (value != null) ref.read(resourceFormNotifierProvider.notifier).categoryChanged(value);
              },
              icon: Icon(Icons.arrow_downward)),
          const SpaceH10(),
          const SizedBox(height: 14),
          Align(
            child: Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(resourceFormNotifierProvider.notifier).addResourcePressed();
                },
                child: const Text("Ajout"),
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (ref.read(resourceFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ]
        ]),
      ),
    );
  }
}
