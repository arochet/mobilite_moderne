// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordFormData {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ResetPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordFormDataCopyWith<ResetPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordFormDataCopyWith<$Res> {
  factory $ResetPasswordFormDataCopyWith(ResetPasswordFormData value,
          $Res Function(ResetPasswordFormData) then) =
      _$ResetPasswordFormDataCopyWithImpl<$Res, ResetPasswordFormData>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ResetPasswordFormDataCopyWithImpl<$Res,
        $Val extends ResetPasswordFormData>
    implements $ResetPasswordFormDataCopyWith<$Res> {
  _$ResetPasswordFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
              as Option<Either<ResetPasswordFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordFormDataImplCopyWith<$Res>
    implements $ResetPasswordFormDataCopyWith<$Res> {
  factory _$$ResetPasswordFormDataImplCopyWith(
          _$ResetPasswordFormDataImpl value,
          $Res Function(_$ResetPasswordFormDataImpl) then) =
      __$$ResetPasswordFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$ResetPasswordFormDataImplCopyWithImpl<$Res>
    extends _$ResetPasswordFormDataCopyWithImpl<$Res,
        _$ResetPasswordFormDataImpl>
    implements _$$ResetPasswordFormDataImplCopyWith<$Res> {
  __$$ResetPasswordFormDataImplCopyWithImpl(_$ResetPasswordFormDataImpl _value,
      $Res Function(_$ResetPasswordFormDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$ResetPasswordFormDataImpl(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
              as Option<Either<ResetPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$ResetPasswordFormDataImpl implements _ResetPasswordFormData {
  const _$ResetPasswordFormDataImpl(
      {required this.emailAddress,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final EmailAddress emailAddress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ResetPasswordFormData(emailAddress: $emailAddress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordFormDataImpl &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
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
  int get hashCode => Object.hash(runtimeType, emailAddress, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordFormDataImplCopyWith<_$ResetPasswordFormDataImpl>
      get copyWith => __$$ResetPasswordFormDataImplCopyWithImpl<
          _$ResetPasswordFormDataImpl>(this, _$identity);
}

abstract class _ResetPasswordFormData implements ResetPasswordFormData {
  const factory _ResetPasswordFormData(
      {required final EmailAddress emailAddress,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ResetPasswordFailure, Unit>>
          authFailureOrSuccessOption}) = _$ResetPasswordFormDataImpl;

  @override
  EmailAddress get emailAddress;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ResetPasswordFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordFormDataImplCopyWith<_$ResetPasswordFormDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
