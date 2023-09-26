// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_news_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddNewsFormData {
  News get news => throw _privateConstructorUsedError;
  XFile? get image => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<NewsFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNewsFormDataCopyWith<AddNewsFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewsFormDataCopyWith<$Res> {
  factory $AddNewsFormDataCopyWith(
          AddNewsFormData value, $Res Function(AddNewsFormData) then) =
      _$AddNewsFormDataCopyWithImpl<$Res, AddNewsFormData>;
  @useResult
  $Res call(
      {News news,
      XFile? image,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewsFailure, Unit>> authFailureOrSuccessOption});

  $NewsCopyWith<$Res> get news;
}

/// @nodoc
class _$AddNewsFormDataCopyWithImpl<$Res, $Val extends AddNewsFormData>
    implements $AddNewsFormDataCopyWith<$Res> {
  _$AddNewsFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? image = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
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
              as Option<Either<NewsFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsCopyWith<$Res> get news {
    return $NewsCopyWith<$Res>(_value.news, (value) {
      return _then(_value.copyWith(news: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddNewsFormDataCopyWith<$Res>
    implements $AddNewsFormDataCopyWith<$Res> {
  factory _$$_AddNewsFormDataCopyWith(
          _$_AddNewsFormData value, $Res Function(_$_AddNewsFormData) then) =
      __$$_AddNewsFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {News news,
      XFile? image,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewsFailure, Unit>> authFailureOrSuccessOption});

  @override
  $NewsCopyWith<$Res> get news;
}

/// @nodoc
class __$$_AddNewsFormDataCopyWithImpl<$Res>
    extends _$AddNewsFormDataCopyWithImpl<$Res, _$_AddNewsFormData>
    implements _$$_AddNewsFormDataCopyWith<$Res> {
  __$$_AddNewsFormDataCopyWithImpl(
      _$_AddNewsFormData _value, $Res Function(_$_AddNewsFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? image = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddNewsFormData(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
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
              as Option<Either<NewsFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddNewsFormData implements _AddNewsFormData {
  const _$_AddNewsFormData(
      {required this.news,
      required this.image,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final News news;
  @override
  final XFile? image;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<NewsFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddNewsFormData(news: $news, image: $image, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNewsFormData &&
            (identical(other.news, news) || other.news == news) &&
            (identical(other.image, image) || other.image == image) &&
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
  int get hashCode => Object.hash(runtimeType, news, image, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddNewsFormDataCopyWith<_$_AddNewsFormData> get copyWith =>
      __$$_AddNewsFormDataCopyWithImpl<_$_AddNewsFormData>(this, _$identity);
}

abstract class _AddNewsFormData implements AddNewsFormData {
  const factory _AddNewsFormData(
      {required final News news,
      required final XFile? image,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<NewsFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AddNewsFormData;

  @override
  News get news;
  @override
  XFile? get image;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<NewsFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddNewsFormDataCopyWith<_$_AddNewsFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
