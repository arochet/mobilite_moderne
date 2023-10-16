import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_failure.freezed.dart';

///Type de failure lié au serveur
@freezed
abstract class SubscriptionFailure with _$SubscriptionFailure {
  const factory SubscriptionFailure.serverError() = ServerError;
  const factory SubscriptionFailure.userError() = UserError;
  const factory SubscriptionFailure.noInternet() = NoInternet;
  const factory SubscriptionFailure.customerUnfound() = CustomerUnfound;
  const factory SubscriptionFailure.paymentFail() = PaymentFail;
}

/// Extention de SubscriptionFailure pour afficher un message d'erreur

extension SubscriptionFailureX on SubscriptionFailure {
  String get message {
    return when(
      serverError: () => "Erreur serveur",
      userError: () => "Erreur utilisateur",
      noInternet: () => "Pas de connexion internet",
      customerUnfound: () => "Client non trouvé",
      paymentFail: () => "Paiement refusé",
    );
  }
}
