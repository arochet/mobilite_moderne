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
  String get documentPath => throw _privateConstructorUsedError;
  String get idCategory => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

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
      String idCategory,
      String keyword,
      String description});
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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      String idCategory,
      String keyword,
      String description});
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
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResourceDTO extends _ResourceDTO {
  const _$_ResourceDTO(
      {@JsonKey(ignore: true) this.id,
      required this.nom,
      required this.type,
      required this.documentPath,
      required this.idCategory,
      required this.keyword,
      required this.description})
      : super._();

  factory _$_ResourceDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ResourceDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String nom;
  @override
  final String type;
  @override
  final String documentPath;
  @override
  final String idCategory;
  @override
  final String keyword;
  @override
  final String description;

  @override
  String toString() {
    return 'ResourceDTO(id: $id, nom: $nom, type: $type, documentPath: $documentPath, idCategory: $idCategory, keyword: $keyword, description: $description)';
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
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, type, documentPath,
      idCategory, keyword, description);

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
      required final String idCategory,
      required final String keyword,
      required final String description}) = _$_ResourceDTO;
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
  String get documentPath;
  @override
  String get idCategory;
  @override
  String get keyword;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ResourceDTOCopyWith<_$_ResourceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
