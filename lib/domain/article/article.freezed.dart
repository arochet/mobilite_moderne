// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Article {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get title => throw _privateConstructorUsedError;
  Nom get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  String get listRessources => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom title,
      Nom brand,
      String description,
      String keyword,
      String listRessources,
      String category});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? brand = null,
    Object? description = null,
    Object? keyword = null,
    Object? listRessources = null,
    Object? category = null,
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
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Nom,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      listRessources: null == listRessources
          ? _value.listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$_ArticleCopyWith(
          _$_Article value, $Res Function(_$_Article) then) =
      __$$_ArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom title,
      Nom brand,
      String description,
      String keyword,
      String listRessources,
      String category});
}

/// @nodoc
class __$$_ArticleCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$_Article>
    implements _$$_ArticleCopyWith<$Res> {
  __$$_ArticleCopyWithImpl(_$_Article _value, $Res Function(_$_Article) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? brand = null,
    Object? description = null,
    Object? keyword = null,
    Object? listRessources = null,
    Object? category = null,
  }) {
    return _then(_$_Article(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Nom,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Nom,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      listRessources: null == listRessources
          ? _value.listRessources
          : listRessources // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Article extends _Article {
  const _$_Article(
      {required this.id,
      required this.title,
      required this.brand,
      required this.description,
      required this.keyword,
      required this.listRessources,
      required this.category})
      : super._();

  @override
  final UniqueId id;
  @override
  final Nom title;
  @override
  final Nom brand;
  @override
  final String description;
  @override
  final String keyword;
  @override
  final String listRessources;
  @override
  final String category;

  @override
  String toString() {
    return 'Article(id: $id, title: $title, brand: $brand, description: $description, keyword: $keyword, listRessources: $listRessources, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Article &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.listRessources, listRessources) ||
                other.listRessources == listRessources) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, brand, description,
      keyword, listRessources, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      __$$_ArticleCopyWithImpl<_$_Article>(this, _$identity);
}

abstract class _Article extends Article {
  const factory _Article(
      {required final UniqueId id,
      required final Nom title,
      required final Nom brand,
      required final String description,
      required final String keyword,
      required final String listRessources,
      required final String category}) = _$_Article;
  const _Article._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get title;
  @override
  Nom get brand;
  @override
  String get description;
  @override
  String get keyword;
  @override
  String get listRessources;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
