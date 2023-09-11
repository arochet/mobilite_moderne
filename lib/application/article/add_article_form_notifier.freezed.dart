// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_article_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddArticleFormData {
  Article get article => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ArticleFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddArticleFormDataCopyWith<AddArticleFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddArticleFormDataCopyWith<$Res> {
  factory $AddArticleFormDataCopyWith(
          AddArticleFormData value, $Res Function(AddArticleFormData) then) =
      _$AddArticleFormDataCopyWithImpl<$Res, AddArticleFormData>;
  @useResult
  $Res call(
      {Article article,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ArticleFailure, Unit>> authFailureOrSuccessOption});

  $ArticleCopyWith<$Res> get article;
}

/// @nodoc
class _$AddArticleFormDataCopyWithImpl<$Res, $Val extends AddArticleFormData>
    implements $AddArticleFormDataCopyWith<$Res> {
  _$AddArticleFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
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
              as Option<Either<ArticleFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleCopyWith<$Res> get article {
    return $ArticleCopyWith<$Res>(_value.article, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddArticleFormDataCopyWith<$Res>
    implements $AddArticleFormDataCopyWith<$Res> {
  factory _$$_AddArticleFormDataCopyWith(_$_AddArticleFormData value,
          $Res Function(_$_AddArticleFormData) then) =
      __$$_AddArticleFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Article article,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ArticleFailure, Unit>> authFailureOrSuccessOption});

  @override
  $ArticleCopyWith<$Res> get article;
}

/// @nodoc
class __$$_AddArticleFormDataCopyWithImpl<$Res>
    extends _$AddArticleFormDataCopyWithImpl<$Res, _$_AddArticleFormData>
    implements _$$_AddArticleFormDataCopyWith<$Res> {
  __$$_AddArticleFormDataCopyWithImpl(
      _$_AddArticleFormData _value, $Res Function(_$_AddArticleFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddArticleFormData(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
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
              as Option<Either<ArticleFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddArticleFormData implements _AddArticleFormData {
  const _$_AddArticleFormData(
      {required this.article,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Article article;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ArticleFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddArticleFormData(article: $article, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddArticleFormData &&
            (identical(other.article, article) || other.article == article) &&
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
  int get hashCode => Object.hash(runtimeType, article, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddArticleFormDataCopyWith<_$_AddArticleFormData> get copyWith =>
      __$$_AddArticleFormDataCopyWithImpl<_$_AddArticleFormData>(
          this, _$identity);
}

abstract class _AddArticleFormData implements AddArticleFormData {
  const factory _AddArticleFormData(
      {required final Article article,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ArticleFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AddArticleFormData;

  @override
  Article get article;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ArticleFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddArticleFormDataCopyWith<_$_AddArticleFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
