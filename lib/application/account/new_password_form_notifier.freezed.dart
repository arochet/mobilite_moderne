// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_password_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPasswordFormData {
  Password get password => throw _privateConstructorUsedError;
  PasswordConfirmation get passwordConfirmation =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<NewPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPasswordFormDataCopyWith<NewPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordFormDataCopyWith<$Res> {
  factory $NewPasswordFormDataCopyWith(
          NewPasswordFormData value, $Res Function(NewPasswordFormData) then) =
      _$NewPasswordFormDataCopyWithImpl<$Res, NewPasswordFormData>;
  @useResult
  $Res call(
      {Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$NewPasswordFormDataCopyWithImpl<$Res, $Val extends NewPasswordFormData>
    implements $NewPasswordFormDataCopyWith<$Res> {
  _$NewPasswordFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
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
              as Option<Either<NewPasswordFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPasswordFormDataImplCopyWith<$Res>
    implements $NewPasswordFormDataCopyWith<$Res> {
  factory _$$NewPasswordFormDataImplCopyWith(_$NewPasswordFormDataImpl value,
          $Res Function(_$NewPasswordFormDataImpl) then) =
      __$$NewPasswordFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$NewPasswordFormDataImplCopyWithImpl<$Res>
    extends _$NewPasswordFormDataCopyWithImpl<$Res, _$NewPasswordFormDataImpl>
    implements _$$NewPasswordFormDataImplCopyWith<$Res> {
  __$$NewPasswordFormDataImplCopyWithImpl(_$NewPasswordFormDataImpl _value,
      $Res Function(_$NewPasswordFormDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$NewPasswordFormDataImpl(
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
              as Option<Either<NewPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$NewPasswordFormDataImpl implements _NewPasswordFormData {
  const _$NewPasswordFormDataImpl(
      {required this.password,
      required this.passwordConfirmation,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final PasswordConfirmation passwordConfirmation;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'NewPasswordFormData(password: $password, passwordConfirmation: $passwordConfirmation, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPasswordFormDataImpl &&
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
  int get hashCode => Object.hash(runtimeType, password, passwordConfirmation,
      showErrorMessages, isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPasswordFormDataImplCopyWith<_$NewPasswordFormDataImpl> get copyWith =>
      __$$NewPasswordFormDataImplCopyWithImpl<_$NewPasswordFormDataImpl>(
          this, _$identity);
}

abstract class _NewPasswordFormData implements NewPasswordFormData {
  const factory _NewPasswordFormData(
      {required final Password password,
      required final PasswordConfirmation passwordConfirmation,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<NewPasswordFailure, Unit>>
          authFailureOrSuccessOption}) = _$NewPasswordFormDataImpl;

  @override
  Password get password;
  @override
  PasswordConfirmation get passwordConfirmation;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<NewPasswordFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$NewPasswordFormDataImplCopyWith<_$NewPasswordFormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
