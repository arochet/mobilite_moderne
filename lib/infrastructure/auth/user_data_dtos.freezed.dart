// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) {
  return _UserDataDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDataDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get userNameLowerCase => throw _privateConstructorUsedError;
  bool get passwordCrypted => throw _privateConstructorUsedError;
  String get typeAccount => throw _privateConstructorUsedError;
  String? get idStripe => throw _privateConstructorUsedError;
  bool? get isBlockedIOS => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDTOCopyWith<UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDTOCopyWith<$Res> {
  factory $UserDataDTOCopyWith(
          UserDataDTO value, $Res Function(UserDataDTO) then) =
      _$UserDataDTOCopyWithImpl<$Res, UserDataDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String? email,
      String? userNameLowerCase,
      bool passwordCrypted,
      String typeAccount,
      String? idStripe,
      bool? isBlockedIOS});
}

/// @nodoc
class _$UserDataDTOCopyWithImpl<$Res, $Val extends UserDataDTO>
    implements $UserDataDTOCopyWith<$Res> {
  _$UserDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = null,
    Object? email = freezed,
    Object? userNameLowerCase = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
    Object? idStripe = freezed,
    Object? isBlockedIOS = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userNameLowerCase: freezed == userNameLowerCase
          ? _value.userNameLowerCase
          : userNameLowerCase // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as String,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlockedIOS: freezed == isBlockedIOS
          ? _value.isBlockedIOS
          : isBlockedIOS // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataDTOImplCopyWith<$Res>
    implements $UserDataDTOCopyWith<$Res> {
  factory _$$UserDataDTOImplCopyWith(
          _$UserDataDTOImpl value, $Res Function(_$UserDataDTOImpl) then) =
      __$$UserDataDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String? email,
      String? userNameLowerCase,
      bool passwordCrypted,
      String typeAccount,
      String? idStripe,
      bool? isBlockedIOS});
}

/// @nodoc
class __$$UserDataDTOImplCopyWithImpl<$Res>
    extends _$UserDataDTOCopyWithImpl<$Res, _$UserDataDTOImpl>
    implements _$$UserDataDTOImplCopyWith<$Res> {
  __$$UserDataDTOImplCopyWithImpl(
      _$UserDataDTOImpl _value, $Res Function(_$UserDataDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = null,
    Object? email = freezed,
    Object? userNameLowerCase = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
    Object? idStripe = freezed,
    Object? isBlockedIOS = freezed,
  }) {
    return _then(_$UserDataDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userNameLowerCase: freezed == userNameLowerCase
          ? _value.userNameLowerCase
          : userNameLowerCase // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as String,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlockedIOS: freezed == isBlockedIOS
          ? _value.isBlockedIOS
          : isBlockedIOS // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataDTOImpl extends _UserDataDTO {
  const _$UserDataDTOImpl(
      {@JsonKey(ignore: true) this.id,
      required this.userName,
      required this.email,
      required this.userNameLowerCase,
      required this.passwordCrypted,
      required this.typeAccount,
      this.idStripe,
      this.isBlockedIOS})
      : super._();

  factory _$UserDataDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataDTOImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String userName;
  @override
  final String? email;
  @override
  final String? userNameLowerCase;
  @override
  final bool passwordCrypted;
  @override
  final String typeAccount;
  @override
  final String? idStripe;
  @override
  final bool? isBlockedIOS;

  @override
  String toString() {
    return 'UserDataDTO(id: $id, userName: $userName, email: $email, userNameLowerCase: $userNameLowerCase, passwordCrypted: $passwordCrypted, typeAccount: $typeAccount, idStripe: $idStripe, isBlockedIOS: $isBlockedIOS)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userNameLowerCase, userNameLowerCase) ||
                other.userNameLowerCase == userNameLowerCase) &&
            (identical(other.passwordCrypted, passwordCrypted) ||
                other.passwordCrypted == passwordCrypted) &&
            (identical(other.typeAccount, typeAccount) ||
                other.typeAccount == typeAccount) &&
            (identical(other.idStripe, idStripe) ||
                other.idStripe == idStripe) &&
            (identical(other.isBlockedIOS, isBlockedIOS) ||
                other.isBlockedIOS == isBlockedIOS));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, email,
      userNameLowerCase, passwordCrypted, typeAccount, idStripe, isBlockedIOS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataDTOImplCopyWith<_$UserDataDTOImpl> get copyWith =>
      __$$UserDataDTOImplCopyWithImpl<_$UserDataDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataDTOImplToJson(
      this,
    );
  }
}

abstract class _UserDataDTO extends UserDataDTO {
  const factory _UserDataDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String userName,
      required final String? email,
      required final String? userNameLowerCase,
      required final bool passwordCrypted,
      required final String typeAccount,
      final String? idStripe,
      final bool? isBlockedIOS}) = _$UserDataDTOImpl;
  const _UserDataDTO._() : super._();

  factory _UserDataDTO.fromJson(Map<String, dynamic> json) =
      _$UserDataDTOImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get userName;
  @override
  String? get email;
  @override
  String? get userNameLowerCase;
  @override
  bool get passwordCrypted;
  @override
  String get typeAccount;
  @override
  String? get idStripe;
  @override
  bool? get isBlockedIOS;
  @override
  @JsonKey(ignore: true)
  _$$UserDataDTOImplCopyWith<_$UserDataDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
