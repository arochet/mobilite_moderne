import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';

//Ajouter freezed !
enum CancelSubscriptionStatus { initial, loading, success, failure }

class CancelSubscriptionState {
  final CancelSubscriptionStatus status;
  final String? msgError;
  final bool showErrorMessages;

  const CancelSubscriptionState({
    this.status = CancelSubscriptionStatus.initial,
    this.msgError,
    this.showErrorMessages = false,
  });

  CancelSubscriptionState copyWith({
    CancelSubscriptionStatus? status,
    String? msgError,
    bool? showErrorMessages,
  }) {
    return CancelSubscriptionState(
      status: status ?? this.status,
      msgError: msgError ?? this.msgError,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
    );
  }
}

class CancelSubscriptionNotifier extends StateNotifier<CancelSubscriptionState> {
  final AuthRepository _authRepository;

  CancelSubscriptionNotifier(this._authRepository) : super(CancelSubscriptionState());

  void setSubscriptionPage() {
    state = (state.copyWith(status: CancelSubscriptionStatus.initial));
  }

  void cancelSubscription(String idSubscription) async {
    state = (state.copyWith(status: CancelSubscriptionStatus.loading));
    print('Annulation de l abonnement $idSubscription');

    final result = await _authRepository.unsubscribeTotalAccess(idSubscription);

    state = result.fold(
      (l) => state.copyWith(status: CancelSubscriptionStatus.failure, msgError: l.toString()),
      (r) => state.copyWith(status: CancelSubscriptionStatus.success),
    );
  }
}
