// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResourceDTO _$ResourceDTOFromJson(Map<String, dynamic> json) {
  return _ResourceDTO.fromJson(json);
}

/// @nodoc
mixin _$ResourceDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Chemin du document dans Firebase Storage
  String get documentPath => throw _privateConstructorUsedError;
  @deprecated
  String get idCategory => throw _privateConstructorUsedError;
  List<String> get keyword => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  String get mainCategory => throw _privateConstructorUsedError;

  /// Nom du fichier de l'image. On reconstitue le chemin avec le mainCategory
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceDTOCopyWith<ResourceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceDTOCopyWith<$Res> {
  factory $ResourceDTOCopyWith(
          ResourceDTO value, $Res Function(ResourceDTO) then) =
      _$ResourceDTOCopyWithImpl<$Res, ResourceDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String nom,
      String type,
      String documentPath,
      @deprecated String idCategory,
      List<String> keyword,
      String description,
      String shortDescription,
      String mainCategory,
      String image});
}

/// @nodoc
class _$ResourceDTOCopyWithImpl<$Res, $Val extends ResourceDTO>
    implements $ResourceDTOCopyWith<$Res> {
  _$ResourceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? type = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? mainCategory = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResourceDTOCopyWith<$Res>
    implements $ResourceDTOCopyWith<$Res> {
  factory _$$_ResourceDTOCopyWith(
          _$_ResourceDTO value, $Res Function(_$_ResourceDTO) then) =
      __$$_ResourceDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String nom,
      String type,
      String documentPath,
      @deprecated String idCategory,
      List<String> keyword,
      String description,
      String shortDescription,
      String mainCategory,
      String image});
}

/// @nodoc
class __$$_ResourceDTOCopyWithImpl<$Res>
    extends _$ResourceDTOCopyWithImpl<$Res, _$_ResourceDTO>
    implements _$$_ResourceDTOCopyWith<$Res> {
  __$$_ResourceDTOCopyWithImpl(
      _$_ResourceDTO _value, $Res Function(_$_ResourceDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? type = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? mainCategory = null,
    Object? image = null,
  }) {
    return _then(_$_ResourceDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResourceDTO extends _ResourceDTO with DiagnosticableTreeMixin {
  const _$_ResourceDTO(
      {@JsonKey(ignore: true) this.id,
      required this.nom,
      required this.type,
      required this.documentPath,
      @deprecated required this.idCategory,
      required final List<String> keyword,
      required this.description,
      required this.shortDescription,
      required this.mainCategory,
      required this.image})
      : _keyword = keyword,
        super._();

  factory _$_ResourceDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ResourceDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String nom;
  @override
  final String type;

  /// Chemin du document dans Firebase Storage
  @override
  final String documentPath;
  @override
  @deprecated
  final String idCategory;
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

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  @override
  final String mainCategory;

  /// Nom du fichier de l'image. On reconstitue le chemin avec le mainCategory
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResourceDTO(id: $id, nom: $nom, type: $type, documentPath: $documentPath, idCategory: $idCategory, keyword: $keyword, description: $description, shortDescription: $shortDescription, mainCategory: $mainCategory, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResourceDTO'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nom', nom))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('documentPath', documentPath))
      ..add(DiagnosticsProperty('idCategory', idCategory))
      ..add(DiagnosticsProperty('keyword', keyword))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('mainCategory', mainCategory))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResourceDTO &&
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
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
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
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResourceDTOCopyWith<_$_ResourceDTO> get copyWith =>
      __$$_ResourceDTOCopyWithImpl<_$_ResourceDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResourceDTOToJson(
      this,
    );
  }
}

abstract class _ResourceDTO extends ResourceDTO {
  const factory _ResourceDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String nom,
      required final String type,
      required final String documentPath,
      @deprecated required final String idCategory,
      required final List<String> keyword,
      required final String description,
      required final String shortDescription,
      required final String mainCategory,
      required final String image}) = _$_ResourceDTO;
  const _ResourceDTO._() : super._();

  factory _ResourceDTO.fromJson(Map<String, dynamic> json) =
      _$_ResourceDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get nom;
  @override
  String get type;
  @override

  /// Chemin du document dans Firebase Storage
  String get documentPath;
  @override
  @deprecated
  String get idCategory;
  @override
  List<String> get keyword;
  @override
  String get description;
  @override
  String get shortDescription;
  @override

  /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
  String get mainCategory;
  @override

  /// Nom du fichier de l'image. On reconstitue le chemin avec le mainCategory
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ResourceDTOCopyWith<_$_ResourceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
