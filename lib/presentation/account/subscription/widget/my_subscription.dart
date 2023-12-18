import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/APPLICATION/auth/subscription_notifier.dart';
import 'package:mobilite_moderne/DOMAIN/auth/subscriptions.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/date_utils.dart';
import 'package:mobilite_moderne/providers.dart';

class MySubscription extends ConsumerWidget {
  final Subscriptions subscription;
  MySubscription(this.subscription, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(subscriptionNotifierProvider);
    final notifier = ref.watch(subscriptionNotifierProvider.notifier);
    if (notifier.state.status == SubscriptionStatus.successCancelSubscription) {
      //SUCCES !
      return _PanelSuccessCancelSubscription();
    } else if (notifier.state.status == SubscriptionStatus.failure) {
      //ERREUR
      return _PanelSubscriptionError(msgError: notifier.state.msgError);
    } else if (notifier.state.status == SubscriptionStatus.loading) {
      //LOADING
      return Center(child: CircularProgressIndicator());
    } else
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Mon abonnement", style: Theme.of(context).textTheme.titleMedium),
            SpaceH10(),
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tarif: ${subscription.tarif} € / mois",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SpaceH5(),
                    if (subscription.items['data'] != null)
                      Text(
                          "Paiement : ${subscription.items['data']?[0]?['plan']['interval'] == 'month' ? 'mensuel' : subscription.items['data'][0]['plan']['interval']} ",
                          style: Theme.of(context).textTheme.bodyMedium),
                    SpaceH5(),
                    Text("Prochaine échéance : ${AppDateUtils.formatDate(subscription.billingCycleAnchor)} ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SpaceH5(),
                    Text("Statut: ${subscription.status ? 'actif' : 'inactif'} ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SpaceH5(),
                    Text("Début de l'abonnement: ${AppDateUtils.formatDate(subscription.startDate)}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SpaceH10(),
                    Align(
                      child: TextButton(
                        onPressed: () {
                          ref.read(subscriptionNotifierProvider.notifier).cancelSubscription(subscription.id);
                        },
                        child: Text("Annuler l'abonnement"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
  }
}

class _PanelSuccessCancelSubscription extends StatelessWidget {
  const _PanelSuccessCancelSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Votre abonnement a bien été annulé\nA bientôt sur Dist'Atelier",
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
