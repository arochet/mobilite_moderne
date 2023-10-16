import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/subscription_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';

//Ajouter freezed !
enum SubscriptionStatus {
  initial,
  formPayment,
  formAddress,
  recap,
  loading,
  success,
  successCancelSubscription,
  failure
}

class SubscriptionState {
  final SubscriptionStatus status;
  final CardFieldInputDetails cardFieldInputDetails;
  final Address address;
  final String? msgError;
  final bool showErrorMessages;
  final String? paymentIntentClientSecret;

  const SubscriptionState({
    this.status = SubscriptionStatus.initial,
    this.cardFieldInputDetails = const CardFieldInputDetails(complete: false),
    this.msgError,
    this.showErrorMessages = false,
    this.paymentIntentClientSecret,
    this.address = const Address(
      city: '',
      postalCode: '',
      country: '',
      line1: '',
      line2: '',
      state: '',
    ),
  });

  SubscriptionState copyWith({
    SubscriptionStatus? status,
    CardFieldInputDetails? cardFieldInputDetails,
    String? msgError,
    bool? showErrorMessages,
    String? city,
    String? postalCode,
    String? country,
    String? line1,
    String? line2,
    String? state,
    String? paymentIntentClientSecret,
  }) {
    return SubscriptionState(
      status: status ?? this.status,
      cardFieldInputDetails: cardFieldInputDetails ?? this.cardFieldInputDetails,
      msgError: msgError ?? this.msgError,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      paymentIntentClientSecret: paymentIntentClientSecret ?? this.paymentIntentClientSecret,
      address: Address(
        city: city ?? this.address.city,
        postalCode: postalCode ?? this.address.postalCode,
        country: country ?? this.address.country,
        line1: line1 ?? this.address.line1,
        line2: line2 ?? this.address.line2,
        state: state ?? this.address.state,
      ),
    );
  }
}

class SubscriptionNotifier extends StateNotifier<SubscriptionState> {
  final AuthRepository _authRepository;

  SubscriptionNotifier(this._authRepository) : super(SubscriptionState());

  void setSubscriptionPage() {
    state = (state.copyWith(status: SubscriptionStatus.initial));
  }

  void disableSubscriptionProcess() {
    state = state.copyWith(
      status: SubscriptionStatus.initial,
      msgError: '',
      showErrorMessages: false,
      city: '',
      postalCode: '',
      country: '',
      line1: '',
      line2: '',
      state: '',
    );
  }

  void setFillAccountPage() {
    state = (state.copyWith(status: SubscriptionStatus.formPayment));
  }

  void setAddressPage() {
    state = (state.copyWith(status: SubscriptionStatus.formAddress));
  }

  void setRecapPage() {
    state = (state.copyWith(showErrorMessages: true));
    if (state.address.city != null &&
        state.address.city!.length > 0 &&
        state.address.postalCode != null &&
        state.address.postalCode!.length > 0 &&
        state.address.country != null &&
        state.address.country!.length > 0 &&
        state.address.line1 != null &&
        state.address.line1!.length > 0) {
      state = (state.copyWith(status: SubscriptionStatus.recap, showErrorMessages: false));
    }
  }

  void onUpdateCardField(CardFieldInputDetails? cardFieldInputDetails) {
    state = state.copyWith(cardFieldInputDetails: cardFieldInputDetails);
  }

  void onUpdateAddressField(
      {String? city, String? postalCode, String? country, String? line1, String? line2, String? stateA}) {
    state = state.copyWith(
      city: city ?? state.address.city,
      postalCode: postalCode ?? state.address.postalCode,
      country: country ?? state.address.country,
      line1: line1 ?? state.address.line1,
      line2: line2 ?? state.address.line2,
      state: stateA ?? state.address.state,
    );
  }

  void subscribeTotalAccess() async {
    state = (state.copyWith(status: SubscriptionStatus.loading));
    final userData = await _authRepository.getUserData();
    final clientSecretAsync = await (userData.fold(() => null, (UserData userData) async {
      if (userData.idStripe == null) {
        print('UserData.idStripe is null');
        return null;
      } else {
        return await _authRepository.subscribeTotalAccess(userData.idStripe!);
      }
    }));

    if (clientSecretAsync == null) {
      state = state.copyWith(
          status: SubscriptionStatus.failure, msgError: 'Les données utilisateur sont manquantes');
    }

    clientSecretAsync?.fold(
      (l) => state = state.copyWith(status: SubscriptionStatus.failure, msgError: l.toString()),
      (clientSecret) {
        state =
            state.copyWith(status: SubscriptionStatus.formAddress, paymentIntentClientSecret: clientSecret);
      },
    );
  }

  void paySubscription() async {
    state = (state.copyWith(status: SubscriptionStatus.loading));

    final result = await _authRepository.paySubscription(state.paymentIntentClientSecret!, state.address);

    state = result.fold(
      (l) => state.copyWith(status: SubscriptionStatus.failure, msgError: l.message),
      (r) => state.copyWith(status: SubscriptionStatus.success),
    );
  }

  void cancelSubscription(String idSubscription) async {
    state = (state.copyWith(status: SubscriptionStatus.loading));
    print('Annulation de l abonnement $idSubscription');

    final result = await _authRepository.unsubscribeTotalAccess(idSubscription);

    state = result.fold(
      (l) => state.copyWith(status: SubscriptionStatus.failure, msgError: l.toString()),
      (r) => state.copyWith(status: SubscriptionStatus.successCancelSubscription),
    );
  }
}
