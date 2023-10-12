import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobilite_moderne/APPLICATION/auth/subscription_notifier.dart';
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
          child: Column(children: [_Subscription()]),
        ),
      ),
    );
  }
}

class _Subscription extends ConsumerWidget {
  const _Subscription({
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
              ref.read(subscriptionNotifierProvider.notifier).onPaymentStart();
            },
            child: const Text('Try again'),
          ),
        ],
      ));
    } else if (notifier.state.status == SubscriptionStatus.loading) {
      return Center(child: Text("Loading"));
    } else
      return Column(
        children: [
          CardFormField(
            controller: CardFormEditController(),
            onCardChanged: (details) =>
                ref.read(subscriptionNotifierProvider.notifier).onUpdateCardField(details),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Est-ce que je suis abonné ? "),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(subscriptionNotifierProvider.notifier).cancelSubscription();
            },
            child: Text("Cancel Subscription"),
          ),
        ],
      );
  }
}
