import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

part 'subscriptions.freezed.dart';

/// Abonnement Stripe. Chaque utilisateur a un abonnement pour l'accès des fonctionnalités de l'app
@freezed
abstract class Subscriptions with _$Subscriptions {
  const Subscriptions._();

  const factory Subscriptions({
    required String id,

    /// Date de début de l'abonnement
    required DateTime? startDate,

    /// Date de prochaine facturation
    required DateTime? billingCycleAnchor,

    /// Correspond au produit de paiement Stripe
    required Map<String, dynamic> items,

    /// Tarif de l'abonnement
    required double tarif,

    /// Statut de l'abonnement : actif ou non
    required bool status,
    String? idStripe,
  }) = _Subscriptions;

  factory Subscriptions.empty() => Subscriptions(
        id: '',
        startDate: DateTime.now(),
        items: [] as Map<String, dynamic>,
        status: false,
        idStripe: null,
        billingCycleAnchor: null,
        tarif: 0,
      );
}
