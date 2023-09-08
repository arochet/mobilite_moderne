import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/auth/register_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:mobilite_moderne/APPLICATION/news/add_news_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

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
                      unexpected: (_) => "Unexpected"),
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
    ref.watch(newsFormNotifierProvider);
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
