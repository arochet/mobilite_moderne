import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/account/new_password_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

final mdpupdate = StateProvider<bool>((ref) => false);

@RoutePage()
class NewPasswordPage extends ConsumerWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<NewPasswordFormData>(newPasswordFormNotifierProvider, (prev, newPasswordInState) {
      newPasswordInState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.warning),
                    messageColor: Colors.red,
                    message: failure.map(
                      serverError: (_) => AppLocalizations.of(context)!.problemedeserveur,
                    )).show(context);
              }, (_) {
                //Authentification réussie !
                ref.read(mdpupdate.notifier).state = true;
                Future.delayed(Duration(seconds: 1), () {
                  ref.read(mdpupdate.notifier).state = false;
                  context.router.replaceAll([
                    MainNavigationRoute(children: [AccountRoute()])
                  ]);
                });
              }));
    });
    return MainScaffold(
      child: ShowComponentFile(child: FormReauthenticate()),
    );
  }
}

class FormReauthenticate extends ConsumerWidget {
  const FormReauthenticate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newPasswordFormNotifierProvider);
    final okmdpupdate = ref.watch(mdpupdate.notifier).state;

    if (okmdpupdate)
      return Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Text(AppLocalizations.of(context)!.motdepassemisajouravecsucces,
              style: Theme.of(context).textTheme.titleMedium),
        ),
      );

    return ContrainedBoxMaxWidth(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
            child: Text(
              AppLocalizations.of(context)!.votrenouveaumotdepasse,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasse,
            ),
            autocorrect: false,
            autofocus: true,
            textInputAction: TextInputAction.next,
            obscureText: true,
            onChanged: (value) => ref.read(newPasswordFormNotifierProvider.notifier).passwordChanged(value),
            validator: (_) {
              final data = ref.read(newPasswordFormNotifierProvider);
              if (data.showErrorMessages) {
                return data.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasseconfirmation,
            ),
            autocorrect: false,
            textInputAction: TextInputAction.done,
            obscureText: true,
            onChanged: (value) =>
                ref.read(newPasswordFormNotifierProvider.notifier).passwordConfirmationChanged(value),
            validator: (_) {
              final data = ref.read(newPasswordFormNotifierProvider);
              if (data.showErrorMessages) {
                return data.passwordConfirmation.value.fold(
                  (f) => f.maybeMap(
                    confirmationPasswordFail: (_) =>
                        AppLocalizations.of(context)!.motdepasseconfirmationdifferent,
                    shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
          ),
          const SizedBox(height: 8),
          //BOUTON VALIDER
          Align(
            child: ElevatedButton(
              onPressed: () {
                printDev();
                ref.read(newPasswordFormNotifierProvider.notifier).newPasswordPressed();
              },
              child: Text(AppLocalizations.of(context)!.valider),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (ref.watch(newPasswordFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ],
          const SizedBox(height: 12),
        ]),
      ),
    );
  }
}
