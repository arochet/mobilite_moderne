import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/auth/reset_password_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AuthResetPasswordPage extends ConsumerWidget {
  const AuthResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ResetPasswordFormData>(resetPasswordFormNotifierProvider, (prev, resetPasswordState) {
      resetPasswordState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.warning),
                    messageColor: Colors.red,
                    message: failure.map(
                      userNotFound: (_) => AppLocalizations.of(context)!.utilisateurpastrouver,
                      serverError: (_) => AppLocalizations.of(context)!.problemedeserveur,
                    )).show(context);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () => context.router.push(AuthInitRoute()));
              }));
    });
    return MainScaffold(child: ShowComponentFile(child: FormReauthenticate()));
  }
}

class FormReauthenticate extends ConsumerWidget {
  const FormReauthenticate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(resetPasswordFormNotifierProvider);
    return ContrainedBoxMaxWidth(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
            child: Text(
              AppLocalizations.of(context)!.votreadresseemail,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            onChanged: (value) {
              ref.read(resetPasswordFormNotifierProvider.notifier).emailChanged(value);
            },
            validator: (_) {
              final signIn = ref.read(resetPasswordFormNotifierProvider);
              if (signIn.showErrorMessages) {
                return signIn.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
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
                ref.read(resetPasswordFormNotifierProvider.notifier).resetPasswordPressed();
              },
              child: const Text("Reinitialiser le mot de passe"),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (ref.read(resetPasswordFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ],
          const SizedBox(height: 12),
        ]),
      ),
    );
  }
}
