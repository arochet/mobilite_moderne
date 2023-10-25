import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/dialogs.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/providers.dart';
import 'panel_list.dart';

class PanelSubscription extends ConsumerStatefulWidget {
  const PanelSubscription({Key? key}) : super(key: key);

  @override
  _PanelInfoState createState() => _PanelInfoState();
}

class _PanelInfoState extends ConsumerState<PanelSubscription> {
  @override
  Widget build(BuildContext context) {
    return PanelList(title: 'PanelInfo', list: [
      //Condition Générale d'Utilisation
      ItemPanelList(
        title: 'Mon abonnement',
        icon: Icons.style,
        onTap: () {
          printDev();
          ref.invalidate(userIsSubscribed);
          context.router.push(Subscription_stripeRoute());
        },
      ),
    ]);
  }
}
