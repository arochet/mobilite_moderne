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

class PanelInfo extends ConsumerStatefulWidget {
  const PanelInfo({Key? key}) : super(key: key);

  @override
  _PanelInfoState createState() => _PanelInfoState();
}

class _PanelInfoState extends ConsumerState<PanelInfo> {
  @override
  Widget build(BuildContext context) {
    return PanelList(title: 'PanelInfo', list: [
      //Condition Générale d'Utilisation
      ItemPanelList(
        title: 'Conditions Générales d\'Utilisation',
        icon: Icons.account_balance,
        onTap: () {
          printDev();
          context.router.push(Term_of_useRoute());
        },
      ),
      //Politique de confidentialité
      ItemPanelList(
        title: 'Politique de confidentialité',
        icon: Icons.pan_tool,
        onTap: () {
          printDev();

          context.router.push(Privacy_policyRoute());
        },
      ),
      //Mention légale
      ItemPanelList(
        title: 'Mentions légales',
        icon: Icons.gavel,
        onTap: () {
          printDev();

          context.router.push(Legal_mentionRoute());
        },
      ),
    ]);
  }
}
