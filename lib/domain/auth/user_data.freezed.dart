// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserData {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get userName => throw _privateConstructorUsedError;
  EmailAddress? get email => throw _privateConstructorUsedError;
  bool get passwordCrypted => throw _privateConstructorUsedError;
  TypeAccount get typeAccount => throw _privateConstructorUsedError;
  String? get idStripe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom userName,
      EmailAddress? email,
      bool passwordCrypted,
      TypeAccount typeAccount,
      String? idStripe});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
    Object? idStripe = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as TypeAccount,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom userName,
      EmailAddress? email,
      bool passwordCrypted,
      TypeAccount typeAccount,
      String? idStripe});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$_UserData>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
    Object? idStripe = freezed,
  }) {
    return _then(_$_UserData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as TypeAccount,
      idStripe: freezed == idStripe
          ? _value.idStripe
          : idStripe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserData extends _UserData {
  const _$_UserData(
      {required this.id,
      required this.userName,
      required this.email,
      required this.passwordCrypted,
      required this.typeAccount,
      this.idStripe})
      : super._();

  @override
  final UniqueId id;
  @override
  final Nom userName;
  @override
  final EmailAddress? email;
  @override
  final bool passwordCrypted;
  @override
  final TypeAccount typeAccount;
  @override
  final String? idStripe;

  @override
  String toString() {
    return 'UserData(id: $id, userName: $userName, email: $email, passwordCrypted: $passwordCrypted, typeAccount: $typeAccount, idStripe: $idStripe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordCrypted, passwordCrypted) ||
                other.passwordCrypted == passwordCrypted) &&
            (identical(other.typeAccount, typeAccount) ||
                other.typeAccount == typeAccount) &&
            (identical(other.idStripe, idStripe) ||
                other.idStripe == idStripe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userName, email, passwordCrypted, typeAccount, idStripe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);
}

abstract class _UserData extends UserData {
  const factory _UserData(
      {required final UniqueId id,
      required final Nom userName,
      required final EmailAddress? email,
      required final bool passwordCrypted,
      required final TypeAccount typeAccount,
      final String? idStripe}) = _$_UserData;
  const _UserData._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get userName;
  @override
  EmailAddress? get email;
  @override
  bool get passwordCrypted;
  @override
  TypeAccount get typeAccount;
  @override
  String? get idStripe;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
