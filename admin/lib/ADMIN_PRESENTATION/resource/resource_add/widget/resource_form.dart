import 'dart:io';

import 'package:admin/ADMIN_APPLICATION/resource/add_resource_form_notifier.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

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

class ResourceForm extends ConsumerStatefulWidget {
  const ResourceForm({Key? key}) : super(key: key);

  @override
  _ResourceFormState createState() => _ResourceFormState();
}

class _ResourceFormState extends ConsumerState<ResourceForm> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final AddResourceFormData resourceFormData = ref.watch(resourceFormNotifierProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
          const SizedBox(height: 8),
          // NOM
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nom'),
            autocorrect: false,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              ref.read(resourceFormNotifierProvider.notifier).nomChanged(value);
            },
            validator: (_) {
              return null;
            },
          ),
          SpaceH10(),

          // TYPE
          DropdownButton(
              isExpanded: true,
              value: resourceFormData.resource.type,
              dropdownColor: Colors.black,
              focusColor: Colors.black,
              iconEnabledColor: Colors.white,
              items: ResourceType.values
                  .where((element) => element != ResourceType.link)
                  .map((ResourceType e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              onChanged: (ResourceType? value) {
                if (resourceFormData.nameFile != null) {
                  showSnackBar(context, 'Vous devez avoir aucun fichier sélectionné');
                  return;
                }
                if (value != null) {
                  ref.read(resourceFormNotifierProvider.notifier).typeChanged(value);
                }
              },
              icon: Icon(Icons.arrow_downward)),
          SpaceH10(),
          Text(resourceFormData.nameFile ?? "",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          SpaceH10(),
          // AJOUTER UN FICHIER
          ElevatedButton(
              onPressed: () async {
                try {
                  FilePickerResult? result;

                  if (ref.read(resourceFormNotifierProvider).resource.type == ResourceType.document) {
                    result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: [
                      'pdf',
                    ]);
                  } else if (ref.read(resourceFormNotifierProvider).resource.type == ResourceType.video) {
                    result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: [
                      'mp4',
                      'm4v',
                      'mov',
                      'avi',
                      'flv',
                      'wmv',
                      'asf',
                      'mpeg',
                      'mpg',
                      'vob',
                      'mkv',
                      'asf'
                    ]);
                  }

                  if (result != null) {
                    final platformFile = result.files.single;

                    if (kIsWeb) {
                      final Uint8List? mesButes = platformFile.bytes;
                      if (mesButes != null) {
                        ref
                            .read(resourceFormNotifierProvider.notifier)
                            .fileWEBchanged(mesButes, platformFile.name);
                      }
                    } else {
                      ref
                          .read(resourceFormNotifierProvider.notifier)
                          .fileMOBILEchanged(File(platformFile.path!), platformFile.name);

                      // TODO : Ajouter la conversion du fichier en texte pour la description
                      // >>>>>>>>      <<<<<<<<<<<
                      final textFromPDF = await getPDFtext(platformFile.path!);
                      print('textFromPDF : $textFromPDF');
                      _descriptionController.text = textFromPDF;
                      ref.read(resourceFormNotifierProvider.notifier).descriptionChanged(textFromPDF);
                    }
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

          // DESCRIPTION
          Text(
              "L'ajout automatique de description lié au PDF est uniqment disponible sur mobile. Elle sert uniquement pour le moteur de recherche",
              style: Theme.of(context).textTheme.bodySmall),
          SpaceH5(),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            autocorrect: false,
            controller: _descriptionController,
            minLines: 5,
            maxLines: 20,
            onChanged: (value) {
              ref.read(resourceFormNotifierProvider.notifier).descriptionChanged(value);
            },
            validator: (_) {
              return null;
            },
          ),
          SpaceH20(),

          // DESCRIPTION COURTE
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description Courte'),
            autocorrect: false,
            minLines: 2,
            maxLines: 5,
            onChanged: (value) {
              ref.read(resourceFormNotifierProvider.notifier).shortDescriptionChanged(value);
            },
            validator: (_) {
              return null;
            },
          ),
          SpaceH20(),
          Text("Séparez les mots clés par des /. Exemple : kw1/kw2/kw3",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          SizedBox(height: 3),

          // MOTS CLES
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

          Text(resourceFormData.resource.image,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          SpaceH10(),
          ElevatedButton(
              onPressed: () async {
                try {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

                  if (image == null) {
                    showSnackBar(context, 'Pas d\'image sélectionnée');
                  }
                  if (image != null) {
                    ref.read(resourceFormNotifierProvider.notifier).imageChanged(image);
                  }
                } catch (e, trace) {
                  showSnackBar(context, 'Erreur lors de la sélection de l\'image : $e');
                  print(e);
                  print(trace);
                }
              },
              child: const Text("Ajouter une image")),

          const SpaceH10(),

          // MAIN CATEGORY
          DropdownButton(
              isExpanded: true,
              value: resourceFormData.category,
              dropdownColor: Colors.black,
              focusColor: Colors.black,
              iconEnabledColor: Colors.white,
              items: ResourceMainCategory.values
                  .map((ResourceMainCategory e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (ResourceMainCategory? value) {
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

  Future<String> getPDFtext(String path) async {
    String text = "";
    try {
      text = await ReadPdfText.getPDFtext(path);
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    return text;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
  }
}
