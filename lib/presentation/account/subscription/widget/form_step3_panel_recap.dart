import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';

class PanelRecap extends ConsumerStatefulWidget {
  const PanelRecap({Key? key}) : super(key: key);

  @override
  _PanelRecapState createState() => _PanelRecapState();
}

class _PanelRecapState extends ConsumerState<PanelRecap> {
  @override
  Widget build(BuildContext context) {
    final state = ref.read(subscriptionNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SpaceH10(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Récapitulatif de votre abonnement",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SpaceH10(),

          //ADRESSE DE FACTURATION
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Adresse de facturation", style: Theme.of(context).textTheme.titleMedium),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${state.address.country}", style: Theme.of(context).textTheme.bodyLarge),
                  Text("${state.address.city}   ${state.address.postalCode}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("${state.address.line1}\n${state.address.line2}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
          SpaceH20(),

          //RECAPITULATIF ABONNEMENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text("Somme à payer", style: Theme.of(context).textTheme.titleMedium),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Abonnement Dist'Atelier : 10€/mois", style: Theme.of(context).textTheme.bodyLarge),
                  SpaceH5(),
                  Text("Paiment : mensuel", style: Theme.of(context).textTheme.bodyLarge),
                  SpaceH10(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Somme à payer : 10€",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          SpaceH20(),

          //BOUTONS DE VALIDATION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(subscriptionNotifierProvider.notifier).disableSubscriptionProcess();
                },
                child: Text("Annuler"),
              ),
              SpaceW10(),
              ElevatedButton(
                onPressed: () {
                  if (kIsWeb)
                    ref.read(subscriptionNotifierProvider.notifier).paySubscriptionWEB();
                  else
                    ref.read(subscriptionNotifierProvider.notifier).paySubscription();
                },
                child: Text("S'abonner"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
