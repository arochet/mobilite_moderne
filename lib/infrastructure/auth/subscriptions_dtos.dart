import 'package:mobilite_moderne/DOMAIN/auth/subscriptions.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'subscriptions_dtos.freezed.dart';
part 'subscriptions_dtos.g.dart';

/// <b>Fiche utilisateur</b><br>
/// DTO = Data Transfer Object<br>
/// On utilise les DTO pour communiquer avec Firestore<br>
/// On convertis ensuite SubscriptionsDTO en Subscriptions<br>
@freezed
abstract class SubscriptionsDTO implements _$SubscriptionsDTO {
  const SubscriptionsDTO._();

  const factory SubscriptionsDTO({
    String? id,
    @JsonKey(name: 'start_date') required int? startDate,
    required Map<String, dynamic> items,
    required String status,
    String? idStripe,
  }) = _SubscriptionsDTO;

  Subscriptions toDomain() {
    return Subscriptions(
      id: id ?? '??',
      items: items,
      status: status == 'active',
      startDate: DateTime.fromMillisecondsSinceEpoch(startDate! * 1000),
      tarif: items['data'][0]['price']['unit_amount'] / 100,
      idStripe: idStripe,
    );
  }

  /// Convertit un Json en SubscriptionsDTO<br>
  factory SubscriptionsDTO.fromJson(Map<String, dynamic> json) => _$SubscriptionsDTOFromJson(json);

  /// Convertit un DocumentSnapshot de FireStore en SubscriptionsDTO<br>
  factory SubscriptionsDTO.fromFirestore(DocumentSnapshot doc) {
    return SubscriptionsDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
