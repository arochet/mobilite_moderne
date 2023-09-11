// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleDTO _$ArticleDTOFromJson(Map<String, dynamic> json) {
  return _ArticleDTO.fromJson(json);
}

/// @nodoc
mixin _$ArticleDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  String get listRessources => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleDTOCopyWith<ArticleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDTOCopyWith<$Res> {
  factory $ArticleDTOCopyWith(
          ArticleDTO value, $Res Function(ArticleDTO) then) =
      _$ArticleDTOCopyWithImpl<$Res, ArticleDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String title,
      String brand,
      String description,
      String keyword,
      String listRessources,
      String category});
}

/// @nodoc
class _$ArticleDTOCopyWithImpl<$Res, $Val extends ArticleDTO>
    implements $ArticleDTOCopyWith<$Res> {
  _$ArticleDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? brand = null,
    Object? description = null,
    Object? keyword = null,
    Object? listRessources = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_ArticleDTOCopyWith<$Res>
    implements $ArticleDTOCopyWith<$Res> {
  factory _$$_ArticleDTOCopyWith(
          _$_ArticleDTO value, $Res Function(_$_ArticleDTO) then) =
      __$$_ArticleDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String title,
      String brand,
      String description,
      String keyword,
      String listRessources,
      String category});
}

/// @nodoc
class __$$_ArticleDTOCopyWithImpl<$Res>
    extends _$ArticleDTOCopyWithImpl<$Res, _$_ArticleDTO>
    implements _$$_ArticleDTOCopyWith<$Res> {
  __$$_ArticleDTOCopyWithImpl(
      _$_ArticleDTO _value, $Res Function(_$_ArticleDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? brand = null,
    Object? description = null,
    Object? keyword = null,
    Object? listRessources = null,
    Object? category = null,
  }) {
    return _then(_$_ArticleDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$_ArticleDTO extends _ArticleDTO {
  const _$_ArticleDTO(
      {@JsonKey(ignore: true) this.id,
      required this.title,
      required this.brand,
      required this.description,
      required this.keyword,
      required this.listRessources,
      required this.category})
      : super._();

  factory _$_ArticleDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String title;
  @override
  final String brand;
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
    return 'ArticleDTO(id: $id, title: $title, brand: $brand, description: $description, keyword: $keyword, listRessources: $listRessources, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleDTO &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, brand, description,
      keyword, listRessources, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleDTOCopyWith<_$_ArticleDTO> get copyWith =>
      __$$_ArticleDTOCopyWithImpl<_$_ArticleDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleDTOToJson(
      this,
    );
  }
}

abstract class _ArticleDTO extends ArticleDTO {
  const factory _ArticleDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String title,
      required final String brand,
      required final String description,
      required final String keyword,
      required final String listRessources,
      required final String category}) = _$_ArticleDTO;
  const _ArticleDTO._() : super._();

  factory _ArticleDTO.fromJson(Map<String, dynamic> json) =
      _$_ArticleDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get title;
  @override
  String get brand;
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
  _$$_ArticleDTOCopyWith<_$_ArticleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
