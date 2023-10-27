import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';

class PanelFormPayment extends ConsumerWidget {
  const PanelFormPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
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
            if (kIsWeb) ...[
              _CardField(),
            ],
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                ref.read(subscriptionNotifierProvider.notifier).subscribeTotalAccess();
              },
              child: Text("Continuer"),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardField extends ConsumerStatefulWidget {
  const _CardField({Key? key}) : super(key: key);

  @override
  __CardFieldState createState() => __CardFieldState();
}

class __CardFieldState extends ConsumerState<_CardField> {
  late stripe.CardEditController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = stripe.CardEditController();
  }

  @override
  Widget build(BuildContext context) {
    return stripe.CardField(
      controller: controller,
      onCardChanged: (details) {
        print('change');
        ref.read(subscriptionNotifierProvider.notifier).onUpdateCardField(stripe.CardFieldInputDetails(
              complete: true,
              expiryMonth: 4,
              expiryYear: 24,
              postalCode: '42424',
              brand: 'visa',
              number: '4242424242424242',
              cvc: '242',
              validExpiryDate: stripe.CardValidationState.Valid,
              validCVC: stripe.CardValidationState.Valid,
              validNumber: stripe.CardValidationState.Valid,
            ));
      },
    );
  }
}
