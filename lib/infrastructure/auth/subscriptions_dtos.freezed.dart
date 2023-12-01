// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionsDTO _$SubscriptionsDTOFromJson(Map<String, dynamic> json) {
  return _SubscriptionsDTO.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionsDTO {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  int? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_cycle_anchor')
  int? get billingCycleAnchor => throw _privateConstructorUsedError;
  Map<String, dynamic> get items => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get idStripe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionsDTOCopyWith<SubscriptionsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsDTOCopyWith<$Res> {
  factory $SubscriptionsDTOCopyWith(
          SubscriptionsDTO value, $Res Function(SubscriptionsDTO) then) =
      _$SubscriptionsDTOCopyWithImpl<$Res, SubscriptionsDTO>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'start_date') int? startDate,
      @JsonKey(name: 'billing_cycle_anchor') int? billingCycleAnchor,
      Map<String, dynamic> items,
      String status,
      String? idStripe});
}

/// @nodoc
class _$SubscriptionsDTOCopyWithImpl<$Res, $Val extends SubscriptionsDTO>
    implements $SubscriptionsDTOCopyWith<$Res> {
  _$SubscriptionsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? billingCycleAnchor = freezed,
    Object? items = null,
    Object? status = null,
    Object? idStripe = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      billingCycleAnchor: freezed == billingCycleAnchor
          ? _value.billingCycleAnchor
          : billingCycleAnchor // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionsDTOImplCopyWith<$Res>
    implements $SubscriptionsDTOCopyWith<$Res> {
  factory _$$SubscriptionsDTOImplCopyWith(_$SubscriptionsDTOImpl value,
          $Res Function(_$SubscriptionsDTOImpl) then) =
      __$$SubscriptionsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'start_date') int? startDate,
      @JsonKey(name: 'billing_cycle_anchor') int? billingCycleAnchor,
      Map<String, dynamic> items,
      String status,
      String? idStripe});
}

/// @nodoc
class __$$SubscriptionsDTOImplCopyWithImpl<$Res>
    extends _$SubscriptionsDTOCopyWithImpl<$Res, _$SubscriptionsDTOImpl>
    implements _$$SubscriptionsDTOImplCopyWith<$Res> {
  __$$SubscriptionsDTOImplCopyWithImpl(_$SubscriptionsDTOImpl _value,
      $Res Function(_$SubscriptionsDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? billingCycleAnchor = freezed,
    Object? items = null,
    Object? status = null,
    Object? idStripe = freezed,
  }) {
    return _then(_$SubscriptionsDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      billingCycleAnchor: freezed == billingCycleAnchor
          ? _value.billingCycleAnchor
          : billingCycleAnchor // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionsDTOImpl extends _SubscriptionsDTO {
  const _$SubscriptionsDTOImpl(
      {this.id,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'billing_cycle_anchor') required this.billingCycleAnchor,
      required final Map<String, dynamic> items,
      required this.status,
      this.idStripe})
      : _items = items,
        super._();

  factory _$SubscriptionsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionsDTOImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'start_date')
  final int? startDate;
  @override
  @JsonKey(name: 'billing_cycle_anchor')
  final int? billingCycleAnchor;
  final Map<String, dynamic> _items;
  @override
  Map<String, dynamic> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  final String status;
  @override
  final String? idStripe;

  @override
  String toString() {
    return 'SubscriptionsDTO(id: $id, startDate: $startDate, billingCycleAnchor: $billingCycleAnchor, items: $items, status: $status, idStripe: $idStripe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionsDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.billingCycleAnchor, billingCycleAnchor) ||
                other.billingCycleAnchor == billingCycleAnchor) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idStripe, idStripe) ||
                other.idStripe == idStripe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startDate,
      billingCycleAnchor,
      const DeepCollectionEquality().hash(_items),
      status,
      idStripe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionsDTOImplCopyWith<_$SubscriptionsDTOImpl> get copyWith =>
      __$$SubscriptionsDTOImplCopyWithImpl<_$SubscriptionsDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionsDTOImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionsDTO extends SubscriptionsDTO {
  const factory _SubscriptionsDTO(
      {final String? id,
      @JsonKey(name: 'start_date') required final int? startDate,
      @JsonKey(name: 'billing_cycle_anchor')
      required final int? billingCycleAnchor,
      required final Map<String, dynamic> items,
      required final String status,
      final String? idStripe}) = _$SubscriptionsDTOImpl;
  const _SubscriptionsDTO._() : super._();

  factory _SubscriptionsDTO.fromJson(Map<String, dynamic> json) =
      _$SubscriptionsDTOImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'start_date')
  int? get startDate;
  @override
  @JsonKey(name: 'billing_cycle_anchor')
  int? get billingCycleAnchor;
  @override
  Map<String, dynamic> get items;
  @override
  String get status;
  @override
  String? get idStripe;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionsDTOImplCopyWith<_$SubscriptionsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
