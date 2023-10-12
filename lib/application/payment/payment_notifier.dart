import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//Ajouter freezed !
enum PaymentStatus { initial, loading, success, failure }

class PaymentState {
  final PaymentStatus status;
  final CardFieldInputDetails cardFieldInputDetails;

  const PaymentState({
    this.status = PaymentStatus.initial,
    this.cardFieldInputDetails = const CardFieldInputDetails(complete: false),
  });

  PaymentState copyWith({
    PaymentStatus? status,
    CardFieldInputDetails? cardFieldInputDetails,
  }) {
    return PaymentState(
      status: status ?? this.status,
      cardFieldInputDetails: cardFieldInputDetails ?? this.cardFieldInputDetails,
    );
  }
}

class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier() : super(PaymentState());

  void onPaymentStart() {
    state = (state.copyWith(status: PaymentStatus.initial));
  }

  void onUpdateCardField(CardFieldInputDetails? cardFieldInputDetails) {
    state = state.copyWith(cardFieldInputDetails: cardFieldInputDetails);
  }

  void onPaymentCreateIntent({
    required BillingDetails billingDetails,
    required List<Map<String, dynamic>> items,
  }) async {
    state = (state.copyWith(status: PaymentStatus.loading));

    final paymentMethod = await Stripe.instance.createPaymentMethod(
      params: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: billingDetails,
        ),
      ),
    );

    final paymentIntentResult = await _callPayEndpointMethodId(
      useStripeSdk: true,
      paymentMethodId: paymentMethod.id,
      currency: 'usd',
      items: items,
    );

    if (paymentIntentResult['error'] != null) {
      // Error creating or confirming the payment intent.
      print('Error Payment: ${paymentIntentResult['error']}');
      state = (state.copyWith(status: PaymentStatus.failure));
    }

    if (paymentIntentResult['clientSecret'] != null && paymentIntentResult['requiresAction'] == null) {
      // The payment succedeed / went through.
      state = (state.copyWith(status: PaymentStatus.success));
    }

    if (paymentIntentResult['clientSecret'] != null && paymentIntentResult['requiresAction'] == true) {
      final String clientSecret = paymentIntentResult['clientSecret'];
      onPaymentConfirmIntent(payemnetIntentID: paymentIntentResult['id']);
    } else {}
  }

  void onSubscribe() async {
    state = (state.copyWith(status: PaymentStatus.loading));

    /* final url = Uri.parse('https://us-central1-mobilite-moderne.cloudfunctions.net/SubscribeAccesTotal');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'idStripe': 'cus_OnelLPdvnGSeEP',
      }),
    );
    print('response ${response.statusCode} / ${response.body}');
    final result = json.decode(response.body); */

    final PaymentIntent resultConfirm = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: 'pi_3O05naLoHsD8ZYCO0gwTGtq3_secret_WDNSsee7J7FgBwO03HlYnHY6h',
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              name: 'stripe_user',
              email: 'stripe@yopmail.fr',
              address: Address(
                city: 'Toulon',
                country: 'France',
                line1: '126 rue Denis Litardi',
                postalCode: '83000',
                line2: '',
                state: '',
              ),
            ),
          ),
        ));

    resultConfirm.status;

    if (resultConfirm.status != '200') {
      // Error
      print('Result: ${resultConfirm.id}');
      state = (state.copyWith(status: PaymentStatus.failure));
    } else {
      // The payment succedeed / went through.
      state = (state.copyWith(status: PaymentStatus.success));
    }
  }

  void listSubscription() async {
    state = (state.copyWith(status: PaymentStatus.loading));

    final url = Uri.parse('https://us-central1-mobilite-moderne.cloudfunctions.net/ListSubscription');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'idStripe': 'cus_OnelLPdvnGSeEP',
      }),
    );
    print('response ${response.statusCode} / ${response.body}');
    final result = json.decode(response.body);
    print('==> ${result['']}');

    state = (state.copyWith(status: PaymentStatus.initial));
  }

  void cancelSubscription() async {
    state = (state.copyWith(status: PaymentStatus.loading));

    final url = Uri.parse('https://us-central1-mobilite-moderne.cloudfunctions.net/CancelSubscription');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'idSubscription': 'sub_1O05naLoHsD8ZYCOwGrsshhp',
      }),
    );
    print('response ${response.statusCode} / ${response.body}');
    final result = json.decode(response.body);
    state = (state.copyWith(status: PaymentStatus.initial));
  }

  void onPaymentConfirmIntent({/* required String clientSecret */ required String payemnetIntentID}) async {
    // The payment requires action calling handleNextAction
    try {
      //final paymentIntent = await Stripe.instance.handleNextAction(clientSecret);

      if (/* paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation */ true) {
        // Call API to confirm intent
        Map<String, dynamic> results = await _callPayEndpointIntentId(paymentIntentId: payemnetIntentID);

        if (results['error'] != null) {
          state = (state.copyWith(status: PaymentStatus.failure));
        } else {
          state = (state.copyWith(status: PaymentStatus.success));
        }
      }
    } catch (err) {
      print(err);
      state = (state.copyWith(status: PaymentStatus.failure));
    }
  }

  Future<Map<String, dynamic>> _callPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<Map<String, dynamic>>? items,
  }) async {
    final url =
        Uri.parse('https://us-central1-mobilite-moderne.cloudfunctions.net/StripePayEndpointMethodId');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'useStripeSdk': useStripeSdk,
        'paymentMethodId': paymentMethodId,
        'currency': currency,
        'items': items
      }),
    );
    print('response ${response.statusCode} / ${response.body}');
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> _callPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url =
        Uri.parse('https://us-central1-mobilite-moderne.cloudfunctions.net/StripePayEndpointIntentId');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'paymentIntentId': paymentIntentId,
      }),
    );
    return json.decode(response.body);
  }
}
