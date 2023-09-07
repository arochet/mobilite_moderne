// import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/account/modify_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class ModifyAccountForm extends ConsumerWidget {
  const ModifyAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ModifyFormData>(modifyFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                FlushbarAuthFailure.show(context, failure);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () async {
                  ref.invalidate(currentUserData);
                  await context.router.replaceAll([
                    MainNavigationRoute(children: [AccountRoute()])
                  ]);
                });
              }));
    });
    return FormModifyAccount();
  }
}

class FormModifyAccount extends ConsumerStatefulWidget {
  const FormModifyAccount({
    Key? key,
  }) : super(key: key);

  @override
  _FormModifyAccountState createState() => _FormModifyAccountState();
}

class _FormModifyAccountState extends ConsumerState<FormModifyAccount> {
  //CONTROLLER DU FORMULAIRE POUR L'INITIALISATION DES VALEURS DES CHAMPS
  TextEditingController _controllerUserName = new TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => load(context));
  }

  load(BuildContext context) async {
    //Charge les données de l'utilisateur courant
    final dataAsync = ref.read(currentUserData);
    dataAsync.whenData(
      (dataUser) async {
        if (dataUser != null) {
          //Initialisation du Modify Form Notifier
          ref.read(modifyFormNotifierProvider.notifier).setValueWithUserData(dataUser);

          //Remplis le formulaire
          setState(() {
            _controllerUserName = new TextEditingController(text: dataUser.userName.getOrCrash());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      ref.watch(modifyFormNotifierProvider); //Pour mettre à jour le validator !

      return ContrainedBoxMaxWidth(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(padding: const EdgeInsets.all(18), children: [
            const SizedBox(height: 8),
            //NOM UTILISATEUR
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.nomutilisateur,
              ),
              autocorrect: false,
              onChanged: (value) {
                ref.read(modifyFormNotifierProvider.notifier).userNameChanged(value);
              },
              validator: (_) {
                final registerData = ref.read(modifyFormNotifierProvider);

                if (registerData.showErrorMessages) {
                  return registerData.userName.value.fold(
                    (f) => f.maybeMap(
                      exceedingLenghtOrNull: (_) => AppLocalizations.of(context)!.nominvalide,
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                } else
                  return null;
              },
              controller: _controllerUserName,
            ),
            const SizedBox(height: 8),
            //BOUTON MODIFIER
            Align(
              child: ElevatedButton(
                onPressed: () {
                  printDev();
                  ref.read(modifyFormNotifierProvider.notifier).modifyPressed();
                },
                child: Text(AppLocalizations.of(context)!.modifier),
              ),
            ),
            const SizedBox(height: 12),
            //BARRE DE CHARGEMENT
            if (ref.read(modifyFormNotifierProvider).isSubmitting) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(value: null)
            ],
            const SizedBox(height: 12),
          ]),
        ),
      );
    });
  }
}
