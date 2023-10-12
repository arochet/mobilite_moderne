import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobilite_moderne/APPLICATION/payment/payment_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Subscription_stripePage extends StatelessWidget {
  const Subscription_stripePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Subscription_stripe',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [_Payment()]),
        ),
      ),
    );
  }
}

class _Payment extends ConsumerWidget {
  const _Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(paymentNotifierProvider);
    final notifier = ref.watch(paymentNotifierProvider.notifier);

    if (notifier.state.status == PaymentStatus.success) {
      return Center(child: Text("Success"));
    } else if (notifier.state.status == PaymentStatus.failure) {
      return Center(
          child: Column(
        children: [
          Text("Fail"),
          ElevatedButton(
            onPressed: () {
              ref.read(paymentNotifierProvider.notifier).onPaymentStart();
            },
            child: const Text('Try again'),
          ),
        ],
      ));
    } else if (notifier.state.status == PaymentStatus.loading) {
      return Center(child: Text("Loading"));
    } else
      return Column(
        children: [
          CardFormField(
            controller: CardFormEditController(),
            onCardChanged: (details) => ref.read(paymentNotifierProvider.notifier).onUpdateCardField(details),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(paymentNotifierProvider.notifier).onPaymentCreateIntent(
                billingDetails: BillingDetails(
                  email: 'alban@yopmail.fr',
                ),
                items: [
                  {'id': '0'},
                  {'id': '1'},
                  {'id': '1'},
                  {'id': '1'},
                  {'id': '1'},
                  {'id': '2'},
                ],
              );
            },
            child: Text("Payer"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(paymentNotifierProvider.notifier).listSubscription();
            },
            child: Text("List Subscription"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(paymentNotifierProvider.notifier).cancelSubscription();
            },
            child: Text("Cancel Subscription"),
          ),
        ],
      );
  }
}
