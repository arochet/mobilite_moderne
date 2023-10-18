import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class PanelNewSubscription extends ConsumerWidget {
  const PanelNewSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Card(
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // TITRE
                SpaceH10(),
                Text("Abonnement Dist'Atelier", style: Theme.of(context).textTheme.titleMedium),
                SpaceH20(),

                // SOUS TITRE
                Text(
                    "Votre abonnement Dist'Atelier vous permet d'accéder à l'ensemble des fonctionnalités de l'application !",
                    style: Theme.of(context).textTheme.bodyMedium),
                SpaceH30(),

                // POINTS CLES
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: Theme.of(context).colorScheme.primary),
                        SpaceW10(),
                        Text("Accès à toutes les ressources !",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: Theme.of(context).colorScheme.primary),
                        SpaceW10(),
                        Text("Accès à l'assistance diagnostic",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: Theme.of(context).colorScheme.primary),
                        SpaceW10(),
                        Text("Accès à l'assitance en ligne", style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),

                SpaceH20(),

                // TARIF
                Text("9,99€/mois", style: Theme.of(context).textTheme.titleLarge),
                SpaceH20(),

                // BOUTON S'ABONNER
                ElevatedButton(
                  onPressed: () async {
                    ref.read(subscriptionNotifierProvider.notifier).setFillAccountPage();
                    /* if (kIsWeb) {
                      final user = await ref.read(currentUserData.future);
                      if (user != null) {
                        print('user.idStripe ${user.idStripe}');
                        print('user.name ${user.userName?.getOrCrash()}');
                        final _url =
                            'https://buy.stripe.com/test_9AQdURdoBbl33MA288?client_reference_id=${user.idStripe}&prefilled_email=${user.email?.getOrCrash()}&prefilled_name=${user.userName?.getOrCrash()}';
                        if (!await launchUrl(Uri.parse(_url))) {
                          throw Exception('Could not launch $_url');
                        }
                      }
                    } else {
                      ref.read(subscriptionNotifierProvider.notifier).setFillAccountPage();
                    } */
                  },
                  child: Text("S'abonner"),
                ),
                SpaceH10(),
              ],
            ),
          )),
    );
  }
}
