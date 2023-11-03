import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:mobilite_moderne/APPLICATION/auth/subscription_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';

import 'form_step1_panel_form_payment.dart';
import 'form_step0_panel_new_subscription.dart';
import 'form_step2_panel_form_adress.dart';
import 'form_step3_panel_recap.dart';

class FormSubscription extends ConsumerStatefulWidget {
  const FormSubscription({Key? key}) : super(key: key);

  @override
  _FormSubscriptionState createState() => _FormSubscriptionState();
}

class _FormSubscriptionState extends ConsumerState<FormSubscription> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(subscriptionNotifierProvider);
    final notifier = ref.watch(subscriptionNotifierProvider.notifier);
    //REVOIR
    /* return Column(
      children: [
        SizedBox(
          //height: notifier.state.status == SubscriptionStatus.formPayment ? null : 160,
          child: PanelFormPayment(),
        ),
        Expanded(
            child: SizedBox(
                //height: notifier.state.status == SubscriptionStatus.formAddress ? null : 60,
                child: PanelFormAdress())),
        Expanded(
            child: SizedBox(
          //height: notifier.state.status == SubscriptionStatus.recap ? null : 60,
          child: PanelRecap(),
        )),
      ],
    ); */

    if (notifier.state.status == SubscriptionStatus.success) {
      //SUCCES !
      return _PanelSuccess();
    } else if (notifier.state.status == SubscriptionStatus.failure) {
      //ERREUR
      return _PanelSubscriptionError(msgError: notifier.state.msgError);
    } else if (notifier.state.status == SubscriptionStatus.loading) {
      //LOADING
      return Center(child: CircularProgressIndicator());
    } else if (notifier.state.status == SubscriptionStatus.initial) {
      // PANEL NOUVEL ABONNEMENT
      return PanelNewSubscription();
    } else {
      if (kIsWeb) {
        //WEB
        return Column(
          children: [
            SizedBox(
              height: notifier.state.status == SubscriptionStatus.formPayment ? 200 : 1,
              child: PanelFormPayment(),
            ),
            if (notifier.state.status == SubscriptionStatus.formAddress) Expanded(child: PanelFormAdress()),
            if (notifier.state.status == SubscriptionStatus.recap) Expanded(child: PanelRecap()),
          ],
        );
      } else {
        //MOBILE
        if (notifier.state.status == SubscriptionStatus.formPayment) {
          // PANEL FORMULAIRE DE PAIEMENT
          return PanelFormPayment();
        } else if (notifier.state.status == SubscriptionStatus.formAddress) {
          // PANEL FORMULAIRE ADRESSE
          return PanelFormAdress();
        } else if (notifier.state.status == SubscriptionStatus.recap) {
          // PANEL FILL ACCOUNT INFO
          return PanelRecap();
        } else
          return Center(
              child: Text("Erreur inconnue (state inconnue)", style: Theme.of(context).textTheme.bodyMedium));
      }
    }
  }
}

class _PanelSuccess extends StatelessWidget {
  const _PanelSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Félicitation,\nVous êtes abonné à notre service !",
      style: Theme.of(context).textTheme.titleMedium,
    ));
  }
}

class _PanelSubscriptionError extends ConsumerWidget {
  final String? msgError;
  const _PanelSubscriptionError({
    super.key,
    required this.msgError,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(msgError ?? "Erreur inconnue", style: Theme.of(context).textTheme.titleMedium),
        SpaceH20(),
        ElevatedButton(
          onPressed: () {
            ref.read(subscriptionNotifierProvider.notifier).setSubscriptionPage();
          },
          child: const Text('Try again'),
        ),
      ],
    ));
  }
}
