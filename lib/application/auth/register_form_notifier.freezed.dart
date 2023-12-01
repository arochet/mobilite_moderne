// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterFormData {
  Nom get nomUtilisateur => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  PasswordConfirmation get passwordConfirmation =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormDataCopyWith<RegisterFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormDataCopyWith<$Res> {
  factory $RegisterFormDataCopyWith(
          RegisterFormData value, $Res Function(RegisterFormData) then) =
      _$RegisterFormDataCopyWithImpl<$Res, RegisterFormData>;
  @useResult
  $Res call(
      {Nom nomUtilisateur,
      EmailAddress emailAddress,
      Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$RegisterFormDataCopyWithImpl<$Res, $Val extends RegisterFormData>
    implements $RegisterFormDataCopyWith<$Res> {
  _$RegisterFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomUtilisateur = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      nomUtilisateur: null == nomUtilisateur
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmation,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterFormDataImplCopyWith<$Res>
    implements $RegisterFormDataCopyWith<$Res> {
  factory _$$RegisterFormDataImplCopyWith(_$RegisterFormDataImpl value,
          $Res Function(_$RegisterFormDataImpl) then) =
      __$$RegisterFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Nom nomUtilisateur,
      EmailAddress emailAddress,
      Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$RegisterFormDataImplCopyWithImpl<$Res>
    extends _$RegisterFormDataCopyWithImpl<$Res, _$RegisterFormDataImpl>
    implements _$$RegisterFormDataImplCopyWith<$Res> {
  __$$RegisterFormDataImplCopyWithImpl(_$RegisterFormDataImpl _value,
      $Res Function(_$RegisterFormDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomUtilisateur = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$RegisterFormDataImpl(
      nomUtilisateur: null == nomUtilisateur
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmation,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$RegisterFormDataImpl implements _RegisterFormData {
  const _$RegisterFormDataImpl(
      {required this.nomUtilisateur,
      required this.emailAddress,
      required this.password,
      required this.passwordConfirmation,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Nom nomUtilisateur;
  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final PasswordConfirmation passwordConfirmation;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterFormData(nomUtilisateur: $nomUtilisateur, emailAddress: $emailAddress, password: $password, passwordConfirmation: $passwordConfirmation, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterFormDataImpl &&
            (identical(other.nomUtilisateur, nomUtilisateur) ||
                other.nomUtilisateur == nomUtilisateur) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nomUtilisateur,
      emailAddress,
      password,
      passwordConfirmation,
      showErrorMessages,
      isSubmitting,
      authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterFormDataImplCopyWith<_$RegisterFormDataImpl> get copyWith =>
      __$$RegisterFormDataImplCopyWithImpl<_$RegisterFormDataImpl>(
          this, _$identity);
}

abstract class _RegisterFormData implements RegisterFormData {
  const factory _RegisterFormData(
      {required final Nom nomUtilisateur,
      required final EmailAddress emailAddress,
      required final Password password,
      required final PasswordConfirmation passwordConfirmation,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$RegisterFormDataImpl;

  @override
  Nom get nomUtilisateur;
  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  PasswordConfirmation get passwordConfirmation;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$RegisterFormDataImplCopyWith<_$RegisterFormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
