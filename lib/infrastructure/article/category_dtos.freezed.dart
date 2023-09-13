// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryDTO {
  @JsonKey(ignore: true)
  String? get idCategory => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  List<String>? get listDocument => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDTOCopyWith<CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDTOCopyWith<$Res> {
  factory $CategoryDTOCopyWith(
          CategoryDTO value, $Res Function(CategoryDTO) then) =
      _$CategoryDTOCopyWithImpl<$Res, CategoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? idCategory,
      String nom,
      List<String>? listDocument});
}

/// @nodoc
class _$CategoryDTOCopyWithImpl<$Res, $Val extends CategoryDTO>
    implements $CategoryDTOCopyWith<$Res> {
  _$CategoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? nom = null,
    Object? listDocument = freezed,
  }) {
    return _then(_value.copyWith(
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      listDocument: freezed == listDocument
          ? _value.listDocument
          : listDocument // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDTOCopyWith<$Res>
    implements $CategoryDTOCopyWith<$Res> {
  factory _$$_CategoryDTOCopyWith(
          _$_CategoryDTO value, $Res Function(_$_CategoryDTO) then) =
      __$$_CategoryDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? idCategory,
      String nom,
      List<String>? listDocument});
}

/// @nodoc
class __$$_CategoryDTOCopyWithImpl<$Res>
    extends _$CategoryDTOCopyWithImpl<$Res, _$_CategoryDTO>
    implements _$$_CategoryDTOCopyWith<$Res> {
  __$$_CategoryDTOCopyWithImpl(
      _$_CategoryDTO _value, $Res Function(_$_CategoryDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? nom = null,
    Object? listDocument = freezed,
  }) {
    return _then(_$_CategoryDTO(
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      listDocument: freezed == listDocument
          ? _value._listDocument
          : listDocument // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryDTO extends _CategoryDTO {
  const _$_CategoryDTO(
      {@JsonKey(ignore: true) this.idCategory,
      required this.nom,
      final List<String>? listDocument})
      : _listDocument = listDocument,
        super._();

  factory _$_CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? idCategory;
  @override
  final String nom;
  final List<String>? _listDocument;
  @override
  List<String>? get listDocument {
    final value = _listDocument;
    if (value == null) return null;
    if (_listDocument is EqualUnmodifiableListView) return _listDocument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryDTO(idCategory: $idCategory, nom: $nom, listDocument: $listDocument)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDTO &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            const DeepCollectionEquality()
                .equals(other._listDocument, _listDocument));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, nom,
      const DeepCollectionEquality().hash(_listDocument));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDTOCopyWith<_$_CategoryDTO> get copyWith =>
      __$$_CategoryDTOCopyWithImpl<_$_CategoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDTOToJson(
      this,
    );
  }
}

abstract class _CategoryDTO extends CategoryDTO {
  const factory _CategoryDTO(
      {@JsonKey(ignore: true) final String? idCategory,
      required final String nom,
      final List<String>? listDocument}) = _$_CategoryDTO;
  const _CategoryDTO._() : super._();

  factory _CategoryDTO.fromJson(Map<String, dynamic> json) =
      _$_CategoryDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get idCategory;
  @override
  String get nom;
  @override
  List<String>? get listDocument;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDTOCopyWith<_$_CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
