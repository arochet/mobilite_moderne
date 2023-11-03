import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/providers.dart';

class PanelFormAdress extends ConsumerWidget {
  const PanelFormAdress({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(subscriptionNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Votre adresse de facturation", style: Theme.of(context).textTheme.titleLarge),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (ref.watch(environment).name == Environment.dev)
                      ElevatedButton(
                          onPressed: () {
                            ref.read(subscriptionNotifierProvider.notifier).onUpdateAddressField(
                                  country: "FR",
                                  city: "Paris",
                                  postalCode: "75000",
                                  line1: "1 rue de la paix",
                                  line2: "Batiment A",
                                );
                            ref.read(subscriptionNotifierProvider.notifier).setRecapPage();
                          },
                          child: Text("Remplir champs")),

                    //PAYS
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Pays'),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onChanged: (value) {
                        ref.read(subscriptionNotifierProvider.notifier).onUpdateAddressField(country: value);
                      },
                      validator: (_) {
                        final sub = ref.read(subscriptionNotifierProvider);
                        if (sub.showErrorMessages &&
                            (sub.address.country == null || sub.address.country!.length == 0))
                          return 'Veuillez renseigner un pays';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    //VILLE
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Ville'),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onChanged: (value) {
                        ref.read(subscriptionNotifierProvider.notifier).onUpdateAddressField(city: value);
                      },
                      validator: (_) {
                        final sub = ref.read(subscriptionNotifierProvider);
                        if (sub.showErrorMessages &&
                            (sub.address.city == null || sub.address.city!.length == 0))
                          return 'Veuillez renseigner une ville';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    //CODE POSTALE
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Code Postal',
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onChanged: (value) {
                        ref
                            .read(subscriptionNotifierProvider.notifier)
                            .onUpdateAddressField(postalCode: value);
                      },
                      validator: (_) {
                        final sub = ref.read(subscriptionNotifierProvider);
                        if (sub.showErrorMessages &&
                            (sub.address.postalCode == null || sub.address.postalCode!.length != 5))
                          return 'Le code postal doit comporter 5 chiffres';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    //ADRESSE
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Adresse',
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onChanged: (value) {
                        ref.read(subscriptionNotifierProvider.notifier).onUpdateAddressField(line1: value);
                      },
                      validator: (_) {
                        final sub = ref.read(subscriptionNotifierProvider);
                        if (sub.showErrorMessages &&
                            (sub.address.line1 == null || sub.address.line1!.length == 0))
                          return 'Veuillez renseigner l\'adresse';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    //COMPLEMENT ADRESSE
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Complément d\'adresse',
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      onChanged: (value) {
                        ref.read(subscriptionNotifierProvider.notifier).onUpdateAddressField(line2: value);
                      },
                      validator: (_) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    Align(
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(subscriptionNotifierProvider.notifier).setRecapPage();
                        },
                        child: Text("Suivant"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
