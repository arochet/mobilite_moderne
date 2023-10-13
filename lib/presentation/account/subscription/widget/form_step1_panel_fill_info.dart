import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:mobilite_moderne/providers.dart';

class PanelFormFillInfo extends ConsumerWidget {
  const PanelFormFillInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        stripe.CardFormField(
          controller: stripe.CardFormEditController(),
          onCardChanged: (details) =>
              ref.read(subscriptionNotifierProvider.notifier).onUpdateCardField(details),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(subscriptionNotifierProvider.notifier).subscribeTotalAccess();
          },
          child: Text("Continuer"),
        ),
      ],
    );
  }
}
