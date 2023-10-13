import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:mobilite_moderne/APPLICATION/auth/subscription_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';

import 'form_step1_panel_fill_info.dart';
import 'form_step0_panel_new_subscription.dart';
import 'form_step2_panel_fill_adress.dart';
import 'form_step3_panel_recap.dart';

class FormSubscription extends ConsumerWidget {
  const FormSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(subscriptionNotifierProvider);
    final notifier = ref.watch(subscriptionNotifierProvider.notifier);

    if (notifier.state.status == SubscriptionStatus.success) {
      return Center(child: Text("Success"));
    } else if (notifier.state.status == SubscriptionStatus.failure) {
      return Center(
          child: Column(
        children: [
          Text("Fail"),
          ElevatedButton(
            onPressed: () {
              ref.read(subscriptionNotifierProvider.notifier).setSubscriptionPage();
            },
            child: const Text('Try again'),
          ),
        ],
      ));
    } else if (notifier.state.status == SubscriptionStatus.loading) {
      return Center(child: CircularProgressIndicator());
    } else if (notifier.state.status == SubscriptionStatus.initial) {
      // PANEL NOUVEL ABONNEMENT
      return PanelNewSubscription();
    } else if (notifier.state.status == SubscriptionStatus.fillAccountInfo) {
      // PANEL FILL ACCOUNT INFO
      return PanelFormFillInfo();
    } else if (notifier.state.status == SubscriptionStatus.fillAddress) {
      // PANEL FILL ACCOUNT INFO
      return PanelFormFillAdress();
    } else if (notifier.state.status == SubscriptionStatus.recap) {
      // PANEL FILL ACCOUNT INFO
      return PanelRecap();
    } else
      return Column(
        children: [
          stripe.CardFormField(
            controller: stripe.CardFormEditController(),
            onCardChanged: (details) =>
                ref.read(subscriptionNotifierProvider.notifier).onUpdateCardField(details),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Est-ce que je suis abonné ? "),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(subscriptionNotifierProvider.notifier).cancelSubscription('a remplir !!');
            },
            child: Text("Cancel Subscription"),
          ),
        ],
      );
  }
}
