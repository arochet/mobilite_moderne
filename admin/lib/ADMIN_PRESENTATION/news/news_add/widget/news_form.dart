import 'dart:io';

import 'package:admin/ADMIN_APPLICATION/news/add_news_form_notifier.dart';
import 'package:admin/providers.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

class NewsFormProvider extends ConsumerWidget {
  const NewsFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddNewsFormData>(newsFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                  duration: const Duration(seconds: 3),
                  icon: const Icon(Icons.warning),
                  messageColor: Colors.red,
                  message: failure.map(
                    insufficientPermission: (_) => AppLocalizations.of(context)!.permissioninsuffisante,
                    unableToUpdate: (_) => "Unable to update",
                    unexpected: (_) => "Unexpected",
                    unableToLoadImage: (_) => "Unable to load image",
                  ),
                ).show(context);
              }, (_) {
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  context.router.pop();
                });
              }));
    });
    return NewsForm();
  }
}

class NewsForm extends ConsumerWidget {
  const NewsForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFormData = ref.watch(newsFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'title'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(newsFormNotifierProvider.notifier).titleChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(newsFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.news.title.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'title invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        SpaceH10(),
        TextFormField(
          decoration: const InputDecoration(labelText: 'content'),
          autocorrect: false,
          //textInputAction: TextInputAction.next,
          minLines: 5,
          maxLines: 200,
          onChanged: (value) {
            ref.read(newsFormNotifierProvider.notifier).contentChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(newsFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.news.title.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'content invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        SpaceH10(),
        Text("${newsFormData.image?.name ?? ""}",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
        SpaceH10(),
        ElevatedButton(
            onPressed: () async {
              try {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
                print('image ${image?.path}');

                if (image == null) {
                  showSnackBar(context, 'Pas d\'image sélectionnée');
                }
                if (image != null) {
                  ref.read(newsFormNotifierProvider.notifier).imageChanged(image);
                }
              } catch (e, trace) {
                showSnackBar(context, 'Erreur lors de la sélection de l\'image : $e');
                print(e);
                print(trace);
              }
            },
            child: const Text("Ajouter une image")),

        SpaceH20(),
        Text("Séparez les mots clés par des /. Exemple : kw1/kw2/kw3",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
        SizedBox(height: 3),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Keyword'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(newsFormNotifierProvider.notifier).keywordsChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(newsFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.news.title.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'Mot clés invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        SpaceH10(),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Subcontent'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(newsFormNotifierProvider.notifier).subcontentChanged(value);
          },
          minLines: 5,
          maxLines: 200,
          validator: (_) {
            final notifier = ref.read(newsFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.news.title.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'Mot clés invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 8), //insert-field-complete
        const SizedBox(height: 14),
        Align(
          child: Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                ref.read(newsFormNotifierProvider.notifier).addNewsPressed();
              },
              child: const Text("Ajout"),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (ref.read(newsFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}
