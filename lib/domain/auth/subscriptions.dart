import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

part 'subscriptions.freezed.dart';

/// Fiche utilisateur que l'on stocke dans Firestore
@freezed
abstract class Subscriptions with _$Subscriptions {
  const Subscriptions._();

  const factory Subscriptions({
    required String id,
    required DateTime? startDate,
    required Map<String, dynamic> items,
    required double tarif,
    required bool status,
    String? idStripe,
  }) = _Subscriptions;

  factory Subscriptions.empty() => Subscriptions(
        id: '',
        startDate: DateTime.now(),
        items: [] as Map<String, dynamic>,
        status: false,
        idStripe: null,
        tarif: 0,
      );
}
