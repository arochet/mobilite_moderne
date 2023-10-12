import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';

//Ajouter freezed !
enum SubscriptionStatus { initial, fillAccountInfo, recap, loading, success, failure }

class SubscriptionState {
  final SubscriptionStatus status;
  final CardFieldInputDetails cardFieldInputDetails;
  final String? msgError;

  const SubscriptionState({
    this.status = SubscriptionStatus.initial,
    this.cardFieldInputDetails = const CardFieldInputDetails(complete: false),
    this.msgError,
  });

  SubscriptionState copyWith({
    SubscriptionStatus? status,
    CardFieldInputDetails? cardFieldInputDetails,
    String? msgError,
  }) {
    return SubscriptionState(
      status: status ?? this.status,
      cardFieldInputDetails: cardFieldInputDetails ?? this.cardFieldInputDetails,
      msgError: msgError ?? this.msgError,
    );
  }
}

class SubscriptionNotifier extends StateNotifier<SubscriptionState> {
  final AuthRepository _authRepository;

  SubscriptionNotifier(this._authRepository) : super(SubscriptionState());

  void onPaymentStart() {
    state = (state.copyWith(status: SubscriptionStatus.initial));
  }

  void onUpdateCardField(CardFieldInputDetails? cardFieldInputDetails) {
    state = state.copyWith(cardFieldInputDetails: cardFieldInputDetails);
  }

  void onSubscribe(String idStripe) async {
    state = (state.copyWith(status: SubscriptionStatus.loading));

    final result = await _authRepository.subscribeTotalAccess(idStripe);

    result.fold(
      (l) => state.copyWith(status: SubscriptionStatus.failure, msgError: l.toString()),
      (r) => state = state.copyWith(status: SubscriptionStatus.success),
    );
  }

  void paySubscription(
      String paymentIntentClientSecret, Nom name, EmailAddress email, Address address) async {
    state = (state.copyWith(status: SubscriptionStatus.loading));

    final result = await _authRepository.paySubscription(paymentIntentClientSecret, name, email, address);

    result.fold(
      (l) => state.copyWith(status: SubscriptionStatus.failure, msgError: l.toString()),
      (r) => state = state.copyWith(status: SubscriptionStatus.success),
    );
  }

  void cancelSubscription(String idSubscription) async {
    state = (state.copyWith(status: SubscriptionStatus.loading));

    final result = await _authRepository.unsubscribeTotalAccess(idSubscription);

    result.fold(
      (l) => state.copyWith(status: SubscriptionStatus.failure, msgError: l.toString()),
      (r) => state = state.copyWith(status: SubscriptionStatus.success),
    );
  }
}
