// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_message_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddMessageFormData {
  Message get message => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<MessageFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMessageFormDataCopyWith<AddMessageFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMessageFormDataCopyWith<$Res> {
  factory $AddMessageFormDataCopyWith(
          AddMessageFormData value, $Res Function(AddMessageFormData) then) =
      _$AddMessageFormDataCopyWithImpl<$Res, AddMessageFormData>;
  @useResult
  $Res call(
      {Message message,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<MessageFailure, Unit>> authFailureOrSuccessOption});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$AddMessageFormDataCopyWithImpl<$Res, $Val extends AddMessageFormData>
    implements $AddMessageFormDataCopyWith<$Res> {
  _$AddMessageFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
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
              as Option<Either<MessageFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddMessageFormDataImplCopyWith<$Res>
    implements $AddMessageFormDataCopyWith<$Res> {
  factory _$$AddMessageFormDataImplCopyWith(_$AddMessageFormDataImpl value,
          $Res Function(_$AddMessageFormDataImpl) then) =
      __$$AddMessageFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Message message,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<MessageFailure, Unit>> authFailureOrSuccessOption});

  @override
  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$AddMessageFormDataImplCopyWithImpl<$Res>
    extends _$AddMessageFormDataCopyWithImpl<$Res, _$AddMessageFormDataImpl>
    implements _$$AddMessageFormDataImplCopyWith<$Res> {
  __$$AddMessageFormDataImplCopyWithImpl(_$AddMessageFormDataImpl _value,
      $Res Function(_$AddMessageFormDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$AddMessageFormDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
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
              as Option<Either<MessageFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$AddMessageFormDataImpl implements _AddMessageFormData {
  const _$AddMessageFormDataImpl(
      {required this.message,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Message message;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<MessageFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddMessageFormData(message: $message, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMessageFormDataImpl &&
            (identical(other.message, message) || other.message == message) &&
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
  int get hashCode => Object.hash(runtimeType, message, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMessageFormDataImplCopyWith<_$AddMessageFormDataImpl> get copyWith =>
      __$$AddMessageFormDataImplCopyWithImpl<_$AddMessageFormDataImpl>(
          this, _$identity);
}

abstract class _AddMessageFormData implements AddMessageFormData {
  const factory _AddMessageFormData(
      {required final Message message,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<MessageFailure, Unit>>
          authFailureOrSuccessOption}) = _$AddMessageFormDataImpl;

  @override
  Message get message;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<MessageFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$AddMessageFormDataImplCopyWith<_$AddMessageFormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
