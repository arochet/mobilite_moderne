import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/APPLICATION/auth/subscription_notifier.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/subscription_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/subscriptions.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/form_subscription.dart';
import 'widget/my_subscription.dart';

@RoutePage()
class Subscription_stripePage extends StatelessWidget {
  const Subscription_stripePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Abonnement Dist\'Atelier',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: _IsSubscribe(),
        ),
      ),
    );
  }
}

class _IsSubscribe extends ConsumerStatefulWidget {
  const _IsSubscribe({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __IsSubscribeState();
}

class __IsSubscribeState extends ConsumerState<_IsSubscribe> {
  @override
  Widget build(BuildContext context) {
    final subscriptionAsync = ref.watch(userIsSubscribed);
    ref.watch(subscriptionNotifierProvider);
    final notifier = ref.watch(subscriptionNotifierProvider.notifier);

    if (notifier.state.status == SubscriptionStatus.paymentInProgress) {
      //LOADING
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Abonnement en cours de traitement", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                ref.watch(subscriptionNotifierProvider.notifier).setSubscriptionPage();
                ref.invalidate(userIsSubscribed);
                setState(() {});
              },
              child: Text("Recharger l'abonnement"),
            ),
          ],
        ),
      );
    }

    return subscriptionAsync.when(
      data: (Either<SubscriptionFailure, Subscriptions?> subscriptionEither) {
        return subscriptionEither.fold(
          (error) {
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Erreur : $error", style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
            );
          },
          (subscription) {
            if (subscription != null) {
              return MySubscription(subscription);
            } else {
              return FormSubscription();
            }
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );
  }
}
