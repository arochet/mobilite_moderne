import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class PanelFormPayment extends ConsumerWidget {
  const PanelFormPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!kIsWeb)
            stripe.CardFormField(
              style: stripe.CardFormStyle(
                backgroundColor: Color.fromARGB(255, 185, 184, 184),
                textColor: Colors.black,
              ),
              controller: stripe.CardFormEditController(),
              onCardChanged: (details) =>
                  ref.read(subscriptionNotifierProvider.notifier).onUpdateCardField(details),
            ),
          SpaceH10(),
          ElevatedButton(
            onPressed: () {
              ref.read(subscriptionNotifierProvider.notifier).subscribeTotalAccess();
            },
            child: Text("Continuer"),
          ),
        ],
      ),
    );
  }
}
