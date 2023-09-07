import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/auth_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlushbarAuthFailure {
  static show(context, AuthFailure failure) => Flushbar(
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.warning),
        messageColor: Colors.red,
        message: failure.map(
            cancelledByUser: (_) => AppLocalizations.of(context)!.annuler,
            serverError: (_) => AppLocalizations.of(context)!.problemedeserveur,
            emailAlreadyInUse: (_) => AppLocalizations.of(context)!.adresseemaildejautilisee,
            insufficientPermission: (_) => AppLocalizations.of(context)!.permissioninsuffisante,
            invalidPassword: (_) => AppLocalizations.of(context)!.motdepasseinvalid,
            invalidUser: (_) => AppLocalizations.of(context)!.utilisateurpastrouver,
            tooManyRequest: (_) => AppLocalizations.of(context)!.tropderequetes,
            noInternet: (_) => AppLocalizations.of(context)!.pasinternet),
      ).show(context);
}
