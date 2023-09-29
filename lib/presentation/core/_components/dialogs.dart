//PASSWORD
import 'dart:async';

import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_core/app_widget.dart';

/// Vérifier le mot de passe de l'utilisateur
Future<bool?> showDialogPassword<bool>(
    {required BuildContext context, required WidgetRef ref, required bool dissmissable}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  String? textError;

  return showDialog<bool>(
    context: context,
    barrierDismissible: dissmissable == true,
    barrierColor: dissmissable == false ? colorpanel(700) : Colors.black54,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context2, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Entrez le mot de passe', textAlign: TextAlign.center),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: colorpanel(50)),
                      errorText: textError,
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller,
                    obscureText: true,
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        textError = null;
                      });
                    },
                    onFieldSubmitted: (value) async {
                      final res = await reauthenticate(
                          controller,
                          ref,
                          context,
                          () => setState(() {
                                textError = "Mot de passe incorrect";
                              }));
                      if (res) {
                        try {
                          Navigator.of(context2).pop(true);
                        } catch (e) {
                          print('error: $e');
                        }
                      }
                    }),
              ],
            ),
          ),
          backgroundColor: colorpanel(800),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (dissmissable == true) ...[
              TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              SizedBox(width: 10),
            ],
            ElevatedButton(
                child: const Text('Valider'),
                onPressed: () async {
                  final res = await reauthenticate(
                      controller,
                      ref,
                      context,
                      () => setState(() {
                            textError = "Mot de passe incorrect";
                          }));
                  if (res) {
                    try {
                      Navigator.of(context2).pop(true);
                    } catch (e) {
                      print('error: $e');
                    }
                  }
                }),
          ],
        );
      });
    },
  );
}

Future<bool?> showDialogQuestion(BuildContext context, String title, String? body,
    {bool isDanger = false, String txtBtnValidate = 'OK', String txtBtnAnnuler = 'Annuler'}) async {
  return await showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(title),
          content: body != null ? Text(body) : null,
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              child: Text(txtBtnAnnuler),
              onPressed: () {
                printDev();
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: Text(txtBtnValidate),
              onPressed: () {
                printDev();
                Navigator.of(context).pop(true);
              },
              style: isDanger == true ? Theme.of(context).extension<AppThemeExtention>()?.buttonDanger : null,
            ),
          ],
        );
      });
}

/// Vérifier le mot de passe de l'utilisateur dans Firebase
Future<bool> reauthenticate(
    TextEditingController controller, WidgetRef ref, BuildContext context, Function updateTxtError) async {
  Password password = Password(controller.text);

  //Mot de passe incorrect
  if (password.isValid() == false) {
    updateTxtError();
    controller.clear();
    return false;
  }

  //Vérification du mot de passe avec Firebase
  final passwordOK =
      await ref.read(authRepositoryProvider).reauthenticateWithPassword(password: Password(controller.text));
  if (passwordOK.isRight()) {
    if (!Navigator.canPop(context)) {
      return false; // La boîte de dialogue a été fermée
    }
    return true;
  } else {
    updateTxtError();
    controller.clear();
    return false;
  }
}
