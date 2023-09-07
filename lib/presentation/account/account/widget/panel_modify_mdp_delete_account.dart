import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/dialogs.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'panel_list.dart';

class PanelModifyMdpDeleteAccount extends ConsumerStatefulWidget {
  final TypeAccountState typeAccount;
  const PanelModifyMdpDeleteAccount({Key? key, required this.typeAccount}) : super(key: key);

  @override
  _PanelModifyMdpDeleteAccountState createState() => _PanelModifyMdpDeleteAccountState();
}

class _PanelModifyMdpDeleteAccountState extends ConsumerState<PanelModifyMdpDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return PanelList(title: 'PanelModifyMdpDeleteAccount', list: [
      //Modifier le mot de passe
      if (widget.typeAccount == TypeAccountState.email)
        ItemPanelList(
          title: AppLocalizations.of(context)!.modifiermotdepasse,
          icon: Icons.lock,
          onTap: () {
            printDev();
            context.router.push(ReauthenticateRoute(route: NewPasswordRoute()));
          },
        ),
      //Supprimer le compte
      ItemPanelList(
        title: AppLocalizations.of(context)!.supprimerlecompte,
        icon: Icons.cancel,
        onTap: () {
          printDev();
          deleteAccount();
        },
      ),
    ]);
  }

  deleteAccount() {
    // ALERT DIALOG
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.attention),
          content: Text(AppLocalizations.of(context)!.etesvoussurdevouloursupprimervotrecomte),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            //CANCEL BUTTON
            TextButton(
              child: Text(AppLocalizations.of(context)!.annuler),
              onPressed: () => context.router.pop(),
            ),
            //CONTINUE BUTTON
            ElevatedButton(
              onPressed: () async {
                final reauthenticate =
                    await showDialogPassword(context: context, ref: ref, dissmissable: true);
                await context.router.pop();

                if (reauthenticate == true)
                  ref
                      .read(authNotifierProvider.notifier)
                      .deleteAccount(widget.typeAccount)
                      .then((value) => context.router.replaceAll([AuthInitRoute()]));
              },
              child: Text(AppLocalizations.of(context)!.supprimer),
              style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
            ),
          ],
        );
      },
    );
  }
}
