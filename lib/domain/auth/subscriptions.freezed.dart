// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Subscriptions {
  String get id => throw _privateConstructorUsedError;

  /// Date de début de l'abonnement
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// Date de prochaine facturation
  DateTime? get billingCycleAnchor => throw _privateConstructorUsedError;

  /// Correspond au produit de paiement Stripe
  Map<String, dynamic> get items => throw _privateConstructorUsedError;

  /// Tarif de l'abonnement
  double get tarif => throw _privateConstructorUsedError;

  /// Statut de l'abonnement : actif ou non
  bool get status => throw _privateConstructorUsedError;
  String? get idStripe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionsCopyWith<Subscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsCopyWith<$Res> {
  factory $SubscriptionsCopyWith(
          Subscriptions value, $Res Function(Subscriptions) then) =
      _$SubscriptionsCopyWithImpl<$Res, Subscriptions>;
  @useResult
  $Res call(
      {String id,
      DateTime? startDate,
      DateTime? billingCycleAnchor,
      Map<String, dynamic> items,
      double tarif,
      bool status,
      String? idStripe});
}

/// @nodoc
class _$SubscriptionsCopyWithImpl<$Res, $Val extends Subscriptions>
    implements $SubscriptionsCopyWith<$Res> {
  _$SubscriptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = freezed,
    Object? billingCycleAnchor = freezed,
    Object? items = null,
    Object? tarif = null,
    Object? status = null,
    Object? idStripe = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billingCycleAnchor: freezed == billingCycleAnchor
          ? _value.billingCycleAnchor
          : billingCycleAnchor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tarif: null == tarif
          ? _value.tarif
          : tarif // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubscriptionsCopyWith<$Res>
    implements $SubscriptionsCopyWith<$Res> {
  factory _$$_SubscriptionsCopyWith(
          _$_Subscriptions value, $Res Function(_$_Subscriptions) then) =
      __$$_SubscriptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime? startDate,
      DateTime? billingCycleAnchor,
      Map<String, dynamic> items,
      double tarif,
      bool status,
      String? idStripe});
}

/// @nodoc
class __$$_SubscriptionsCopyWithImpl<$Res>
    extends _$SubscriptionsCopyWithImpl<$Res, _$_Subscriptions>
    implements _$$_SubscriptionsCopyWith<$Res> {
  __$$_SubscriptionsCopyWithImpl(
      _$_Subscriptions _value, $Res Function(_$_Subscriptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = freezed,
    Object? billingCycleAnchor = freezed,
    Object? items = null,
    Object? tarif = null,
    Object? status = null,
    Object? idStripe = freezed,
  }) {
    return _then(_$_Subscriptions(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billingCycleAnchor: freezed == billingCycleAnchor
          ? _value.billingCycleAnchor
          : billingCycleAnchor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tarif: null == tarif
          ? _value.tarif
          : tarif // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Subscriptions extends _Subscriptions {
  const _$_Subscriptions(
      {required this.id,
      required this.startDate,
      required this.billingCycleAnchor,
      required final Map<String, dynamic> items,
      required this.tarif,
      required this.status,
      this.idStripe})
      : _items = items,
        super._();

  @override
  final String id;

  /// Date de début de l'abonnement
  @override
  final DateTime? startDate;

  /// Date de prochaine facturation
  @override
  final DateTime? billingCycleAnchor;

  /// Correspond au produit de paiement Stripe
  final Map<String, dynamic> _items;

  /// Correspond au produit de paiement Stripe
  @override
  Map<String, dynamic> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  /// Tarif de l'abonnement
  @override
  final double tarif;

  /// Statut de l'abonnement : actif ou non
  @override
  final bool status;
  @override
  final String? idStripe;

  @override
  String toString() {
    return 'Subscriptions(id: $id, startDate: $startDate, billingCycleAnchor: $billingCycleAnchor, items: $items, tarif: $tarif, status: $status, idStripe: $idStripe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscriptions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.billingCycleAnchor, billingCycleAnchor) ||
                other.billingCycleAnchor == billingCycleAnchor) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.tarif, tarif) || other.tarif == tarif) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idStripe, idStripe) ||
                other.idStripe == idStripe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startDate,
      billingCycleAnchor,
      const DeepCollectionEquality().hash(_items),
      tarif,
      status,
      idStripe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionsCopyWith<_$_Subscriptions> get copyWith =>
      __$$_SubscriptionsCopyWithImpl<_$_Subscriptions>(this, _$identity);
}

abstract class _Subscriptions extends Subscriptions {
  const factory _Subscriptions(
      {required final String id,
      required final DateTime? startDate,
      required final DateTime? billingCycleAnchor,
      required final Map<String, dynamic> items,
      required final double tarif,
      required final bool status,
      final String? idStripe}) = _$_Subscriptions;
  const _Subscriptions._() : super._();

  @override
  String get id;
  @override

  /// Date de début de l'abonnement
  DateTime? get startDate;
  @override

  /// Date de prochaine facturation
  DateTime? get billingCycleAnchor;
  @override

  /// Correspond au produit de paiement Stripe
  Map<String, dynamic> get items;
  @override

  /// Tarif de l'abonnement
  double get tarif;
  @override

  /// Statut de l'abonnement : actif ou non
  bool get status;
  @override
  String? get idStripe;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionsCopyWith<_$_Subscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}
