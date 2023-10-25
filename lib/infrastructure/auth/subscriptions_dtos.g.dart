// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionsDTO _$$_SubscriptionsDTOFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionsDTO(
      id: json['id'] as String?,
      startDate: json['start_date'] as int?,
      billingCycleAnchor: json['billing_cycle_anchor'] as int?,
      items: json['items'] as Map<String, dynamic>,
      status: json['status'] as String,
      idStripe: json['idStripe'] as String?,
    );

Map<String, dynamic> _$$_SubscriptionsDTOToJson(_$_SubscriptionsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'billing_cycle_anchor': instance.billingCycleAnchor,
      'items': instance.items,
      'status': instance.status,
      'idStripe': instance.idStripe,
    };
