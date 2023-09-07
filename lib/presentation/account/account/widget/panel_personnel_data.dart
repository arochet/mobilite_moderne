import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelPersonnelData extends StatelessWidget {
  const PanelPersonnelData({
    Key? key,
    required this.nameUser,
    required this.email,
    required this.typeAccount,
  }) : super(key: key);

  final String nameUser;
  final String? email;
  final TypeAccountState typeAccount;

  @override
  Widget build(BuildContext context) {
    String typeAc = "";
    switch (typeAccount) {
      case TypeAccountState.google:
        typeAc = AppLocalizations.of(context)!.connecteeavecgoogle;
        break;
      default:
        typeAc = "";
        break;
    }
    return PanelList(
      title: 'PanelPersonnelData',
      list: [
        if (typeAccount == TypeAccountState.google)
          ItemPanelList(
            title: typeAc,
            icon: Icons.manage_accounts,
            arrow: false,
            onTap: () {
              printDev();
            },
          ),
        ItemPanelList(
          title: nameUser,
          icon: Icons.account_circle_rounded,
          arrow: false,
          onTap: () {
            printDev();
          },
        ),
        if (email != null)
          ItemPanelList(
            title: email!,
            icon: Icons.mail_rounded,
            arrow: false,
            onTap: () {
              printDev();
            },
          ),
      ],
      //Bouton modifier
      button: TextButton(
        onPressed: () {
          printDev();
          context.router.push(ModifyAccountRoute());
        },
        child: Text(AppLocalizations.of(context)!.modifier),
      ),
    );
  }
}
