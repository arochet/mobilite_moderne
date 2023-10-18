// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Resource {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get nom => throw _privateConstructorUsedError;
  ResourceType get type => throw _privateConstructorUsedError;
  String get documentPath => throw _privateConstructorUsedError;
  UniqueId get idCategory => throw _privateConstructorUsedError;
  List<String> get keyword => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  ResourceMainCategory get mainCategory => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Image qui est charger avec le paramètre image
  Future<Uint8List?>? get imageBytes => throw _privateConstructorUsedError;

  /// Image URL pour le web
  Future<String>? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res, Resource>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      ResourceType type,
      String documentPath,
      UniqueId idCategory,
      List<String> keyword,
      String description,
      String shortDescription,
      ResourceMainCategory mainCategory,
      String image,
      Future<Uint8List?>? imageBytes,
      Future<String>? imageUrl});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res, $Val extends Resource>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? type = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? mainCategory = null,
    Object? image = null,
    Object? imageBytes = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      mainCategory: null == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as ResourceMainCategory,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$$_ResourceCopyWith(
          _$_Resource value, $Res Function(_$_Resource) then) =
      __$$_ResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      ResourceType type,
      String documentPath,
      UniqueId idCategory,
      List<String> keyword,
      String description,
      String shortDescription,
      ResourceMainCategory mainCategory,
      String image,
      Future<Uint8List?>? imageBytes,
      Future<String>? imageUrl});
}

/// @nodoc
class __$$_ResourceCopyWithImpl<$Res>
    extends _$ResourceCopyWithImpl<$Res, _$_Resource>
    implements _$$_ResourceCopyWith<$Res> {
  __$$_ResourceCopyWithImpl(
      _$_Resource _value, $Res Function(_$_Resource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? type = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? mainCategory = null,
    Object? image = null,
    Object? imageBytes = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Resource(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      keyword: null == keyword
          ? _value._keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      mainCategory: null == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as ResourceMainCategory,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
    ));
  }
}

/// @nodoc

class _$_Resource extends _Resource {
  const _$_Resource(
      {required this.id,
      required this.nom,
      required this.type,
      required this.documentPath,
      required this.idCategory,
      required final List<String> keyword,
      required this.description,
      required this.shortDescription,
      required this.mainCategory,
      required this.image,
      this.imageBytes,
      this.imageUrl})
      : _keyword = keyword,
        super._();

  @override
  final UniqueId id;
  @override
  final Nom nom;
  @override
  final ResourceType type;
  @override
  final String documentPath;
  @override
  final UniqueId idCategory;
  final List<String> _keyword;
  @override
  List<String> get keyword {
    if (_keyword is EqualUnmodifiableListView) return _keyword;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyword);
  }

  @override
  final String description;
  @override
  final String shortDescription;
  @override
  final ResourceMainCategory mainCategory;
  @override
  final String image;

  /// Image qui est charger avec le paramètre image
  @override
  final Future<Uint8List?>? imageBytes;

  /// Image URL pour le web
  @override
  final Future<String>? imageUrl;

  @override
  String toString() {
    return 'Resource(id: $id, nom: $nom, type: $type, documentPath: $documentPath, idCategory: $idCategory, keyword: $keyword, description: $description, shortDescription: $shortDescription, mainCategory: $mainCategory, image: $image, imageBytes: $imageBytes, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Resource &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.documentPath, documentPath) ||
                other.documentPath == documentPath) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            const DeepCollectionEquality().equals(other._keyword, _keyword) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.mainCategory, mainCategory) ||
                other.mainCategory == mainCategory) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageBytes, imageBytes) ||
                other.imageBytes == imageBytes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nom,
      type,
      documentPath,
      idCategory,
      const DeepCollectionEquality().hash(_keyword),
      description,
      shortDescription,
      mainCategory,
      image,
      imageBytes,
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResourceCopyWith<_$_Resource> get copyWith =>
      __$$_ResourceCopyWithImpl<_$_Resource>(this, _$identity);
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {required final UniqueId id,
      required final Nom nom,
      required final ResourceType type,
      required final String documentPath,
      required final UniqueId idCategory,
      required final List<String> keyword,
      required final String description,
      required final String shortDescription,
      required final ResourceMainCategory mainCategory,
      required final String image,
      final Future<Uint8List?>? imageBytes,
      final Future<String>? imageUrl}) = _$_Resource;
  const _Resource._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get nom;
  @override
  ResourceType get type;
  @override
  String get documentPath;
  @override
  UniqueId get idCategory;
  @override
  List<String> get keyword;
  @override
  String get description;
  @override
  String get shortDescription;
  @override
  ResourceMainCategory get mainCategory;
  @override
  String get image;
  @override

  /// Image qui est charger avec le paramètre image
  Future<Uint8List?>? get imageBytes;
  @override

  /// Image URL pour le web
  Future<String>? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ResourceCopyWith<_$_Resource> get copyWith =>
      throw _privateConstructorUsedError;
}
