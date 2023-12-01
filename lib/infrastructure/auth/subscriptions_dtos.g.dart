// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionsDTOImpl _$$SubscriptionsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionsDTOImpl(
      id: json['id'] as String?,
      startDate: json['start_date'] as int?,
      billingCycleAnchor: json['billing_cycle_anchor'] as int?,
      items: json['items'] as Map<String, dynamic>,
      status: json['status'] as String,
      idStripe: json['idStripe'] as String?,
    );

Map<String, dynamic> _$$SubscriptionsDTOImplToJson(
        _$SubscriptionsDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'billing_cycle_anchor': instance.billingCycleAnchor,
      'items': instance.items,
      'status': instance.status,
      'idStripe': instance.idStripe,
    };
