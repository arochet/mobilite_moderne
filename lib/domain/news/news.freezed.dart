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
  AppTitle get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get subcontent => throw _privateConstructorUsedError;

  ///Mots clé pour retrouver l'article
  List<String> get keywords => throw _privateConstructorUsedError;

  /// Date de publication de l'article
  DateTime get datePublished => throw _privateConstructorUsedError;

  /// Image qui est charger avec le paramètre image
  Future<Uint8List?>? get imageBytes => throw _privateConstructorUsedError;

  /// Image URL pour le web
  Future<String>? get imageUrl => throw _privateConstructorUsedError;
  List<Resource> get listRessources => throw _privateConstructorUsedError;

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
      AppTitle title,
      String content,
      String image,
      String subcontent,
      List<String> keywords,
      DateTime datePublished,
      Future<Uint8List?>? imageBytes,
      Future<String>? imageUrl,
      List<Resource> listRessources});
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
    Object? datePublished = null,
    Object? imageBytes = freezed,
    Object? imageUrl = freezed,
    Object? listRessources = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AppTitle,
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
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
      listRessources: null == listRessources
          ? _value.listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      AppTitle title,
      String content,
      String image,
      String subcontent,
      List<String> keywords,
      DateTime datePublished,
      Future<Uint8List?>? imageBytes,
      Future<String>? imageUrl,
      List<Resource> listRessources});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
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
    Object? datePublished = null,
    Object? imageBytes = freezed,
    Object? imageUrl = freezed,
    Object? listRessources = null,
  }) {
    return _then(_$NewsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AppTitle,
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
      datePublished: null == datePublished
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
      listRessources: null == listRessources
          ? _value._listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

/// @nodoc

class _$NewsImpl extends _News {
  const _$NewsImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.image,
      required this.subcontent,
      required final List<String> keywords,
      required this.datePublished,
      this.imageBytes,
      this.imageUrl,
      required final List<Resource> listRessources})
      : _keywords = keywords,
        _listRessources = listRessources,
        super._();

  @override
  final UniqueId id;
  @override
  final AppTitle title;
  @override
  final String content;
  @override
  final String image;
  @override
  final String subcontent;

  ///Mots clé pour retrouver l'article
  final List<String> _keywords;

  ///Mots clé pour retrouver l'article
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Date de publication de l'article
  @override
  final DateTime datePublished;

  /// Image qui est charger avec le paramètre image
  @override
  final Future<Uint8List?>? imageBytes;

  /// Image URL pour le web
  @override
  final Future<String>? imageUrl;
  final List<Resource> _listRessources;
  @override
  List<Resource> get listRessources {
    if (_listRessources is EqualUnmodifiableListView) return _listRessources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRessources);
  }

  @override
  String toString() {
    return 'News(id: $id, title: $title, content: $content, image: $image, subcontent: $subcontent, keywords: $keywords, datePublished: $datePublished, imageBytes: $imageBytes, imageUrl: $imageUrl, listRessources: $listRessources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.subcontent, subcontent) ||
                other.subcontent == subcontent) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.imageBytes, imageBytes) ||
                other.imageBytes == imageBytes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._listRessources, _listRessources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      image,
      subcontent,
      const DeepCollectionEquality().hash(_keywords),
      datePublished,
      imageBytes,
      imageUrl,
      const DeepCollectionEquality().hash(_listRessources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);
}

abstract class _News extends News {
  const factory _News(
      {required final UniqueId id,
      required final AppTitle title,
      required final String content,
      required final String image,
      required final String subcontent,
      required final List<String> keywords,
      required final DateTime datePublished,
      final Future<Uint8List?>? imageBytes,
      final Future<String>? imageUrl,
      required final List<Resource> listRessources}) = _$NewsImpl;
  const _News._() : super._();

  @override
  UniqueId get id;
  @override
  AppTitle get title;
  @override
  String get content;
  @override
  String get image;
  @override
  String get subcontent;
  @override

  ///Mots clé pour retrouver l'article
  List<String> get keywords;
  @override

  /// Date de publication de l'article
  DateTime get datePublished;
  @override

  /// Image qui est charger avec le paramètre image
  Future<Uint8List?>? get imageBytes;
  @override

  /// Image URL pour le web
  Future<String>? get imageUrl;
  @override
  List<Resource> get listRessources;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
