// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$News {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get subcontent => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom title,
      String content,
      String image,
      String subcontent,
      List<String> keywords});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? subcontent = null,
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Nom,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subcontent: null == subcontent
          ? _value.subcontent
          : subcontent // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$_NewsCopyWith(_$_News value, $Res Function(_$_News) then) =
      __$$_NewsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom title,
      String content,
      String image,
      String subcontent,
      List<String> keywords});
}

/// @nodoc
class __$$_NewsCopyWithImpl<$Res> extends _$NewsCopyWithImpl<$Res, _$_News>
    implements _$$_NewsCopyWith<$Res> {
  __$$_NewsCopyWithImpl(_$_News _value, $Res Function(_$_News) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? image = null,
    Object? subcontent = null,
    Object? keywords = null,
  }) {
    return _then(_$_News(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Nom,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subcontent: null == subcontent
          ? _value.subcontent
          : subcontent // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_News extends _News {
  const _$_News(
      {required this.id,
      required this.title,
      required this.content,
      required this.image,
      required this.subcontent,
      required final List<String> keywords})
      : _keywords = keywords,
        super._();

  @override
  final UniqueId id;
  @override
  final Nom title;
  @override
  final String content;
  @override
  final String image;
  @override
  final String subcontent;
  final List<String> _keywords;
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  String toString() {
    return 'News(id: $id, title: $title, content: $content, image: $image, subcontent: $subcontent, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_News &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.subcontent, subcontent) ||
                other.subcontent == subcontent) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, image,
      subcontent, const DeepCollectionEquality().hash(_keywords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsCopyWith<_$_News> get copyWith =>
      __$$_NewsCopyWithImpl<_$_News>(this, _$identity);
}

abstract class _News extends News {
  const factory _News(
      {required final UniqueId id,
      required final Nom title,
      required final String content,
      required final String image,
      required final String subcontent,
      required final List<String> keywords}) = _$_News;
  const _News._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get title;
  @override
  String get content;
  @override
  String get image;
  @override
  String get subcontent;
  @override
  List<String> get keywords;
  @override
  @JsonKey(ignore: true)
  _$$_NewsCopyWith<_$_News> get copyWith => throw _privateConstructorUsedError;
}
