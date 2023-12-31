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

  /// Nom de la ressource affiché dans la page
  Nom get nom => throw _privateConstructorUsedError;

  /// Type de ressource : document, vidéo, lien
  ResourceType get type => throw _privateConstructorUsedError;

  /// Chemin du document dans Firebase Storage
  String get documentPath => throw _privateConstructorUsedError;
  @deprecated
  UniqueId get idCategory => throw _privateConstructorUsedError;

  /// Liste de mot clé pour la recherche Algolia
  List<String> get keyword => throw _privateConstructorUsedError;

  /// Description de la ressource, sert pour le moteur de recherche Algolia
  String get description => throw _privateConstructorUsedError;

  /// Description pour l'affichage dans la liste des ressources
  String get shortDescription => throw _privateConstructorUsedError;

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  ResourceMainCategory get mainCategory =>
      throw _privateConstructorUsedError; // Nom du fichier de l'image
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
      @deprecated UniqueId idCategory,
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
abstract class _$$ResourceImplCopyWith<$Res>
    implements $ResourceCopyWith<$Res> {
  factory _$$ResourceImplCopyWith(
          _$ResourceImpl value, $Res Function(_$ResourceImpl) then) =
      __$$ResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      ResourceType type,
      String documentPath,
      @deprecated UniqueId idCategory,
      List<String> keyword,
      String description,
      String shortDescription,
      ResourceMainCategory mainCategory,
      String image,
      Future<Uint8List?>? imageBytes,
      Future<String>? imageUrl});
}

/// @nodoc
class __$$ResourceImplCopyWithImpl<$Res>
    extends _$ResourceCopyWithImpl<$Res, _$ResourceImpl>
    implements _$$ResourceImplCopyWith<$Res> {
  __$$ResourceImplCopyWithImpl(
      _$ResourceImpl _value, $Res Function(_$ResourceImpl) _then)
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
    return _then(_$ResourceImpl(
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

class _$ResourceImpl extends _Resource {
  const _$ResourceImpl(
      {required this.id,
      required this.nom,
      required this.type,
      required this.documentPath,
      @deprecated required this.idCategory,
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

  /// Nom de la ressource affiché dans la page
  @override
  final Nom nom;

  /// Type de ressource : document, vidéo, lien
  @override
  final ResourceType type;

  /// Chemin du document dans Firebase Storage
  @override
  final String documentPath;
  @override
  @deprecated
  final UniqueId idCategory;

  /// Liste de mot clé pour la recherche Algolia
  final List<String> _keyword;

  /// Liste de mot clé pour la recherche Algolia
  @override
  List<String> get keyword {
    if (_keyword is EqualUnmodifiableListView) return _keyword;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyword);
  }

  /// Description de la ressource, sert pour le moteur de recherche Algolia
  @override
  final String description;

  /// Description pour l'affichage dans la liste des ressources
  @override
  final String shortDescription;

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  @override
  final ResourceMainCategory mainCategory;
// Nom du fichier de l'image
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
            other is _$ResourceImpl &&
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
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      __$$ResourceImplCopyWithImpl<_$ResourceImpl>(this, _$identity);
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {required final UniqueId id,
      required final Nom nom,
      required final ResourceType type,
      required final String documentPath,
      @deprecated required final UniqueId idCategory,
      required final List<String> keyword,
      required final String description,
      required final String shortDescription,
      required final ResourceMainCategory mainCategory,
      required final String image,
      final Future<Uint8List?>? imageBytes,
      final Future<String>? imageUrl}) = _$ResourceImpl;
  const _Resource._() : super._();

  @override
  UniqueId get id;
  @override

  /// Nom de la ressource affiché dans la page
  Nom get nom;
  @override

  /// Type de ressource : document, vidéo, lien
  ResourceType get type;
  @override

  /// Chemin du document dans Firebase Storage
  String get documentPath;
  @override
  @deprecated
  UniqueId get idCategory;
  @override

  /// Liste de mot clé pour la recherche Algolia
  List<String> get keyword;
  @override

  /// Description de la ressource, sert pour le moteur de recherche Algolia
  String get description;
  @override

  /// Description pour l'affichage dans la liste des ressources
  String get shortDescription;
  @override

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  ResourceMainCategory get mainCategory;
  @override // Nom du fichier de l'image
  String get image;
  @override

  /// Image qui est charger avec le paramètre image
  Future<Uint8List?>? get imageBytes;
  @override

  /// Image URL pour le web
  Future<String>? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
