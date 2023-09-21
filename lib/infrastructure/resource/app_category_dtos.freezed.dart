// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_category_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppCategoryDTO _$AppCategoryDTOFromJson(Map<String, dynamic> json) {
  return _AppCategoryDTO.fromJson(json);
}

/// @nodoc
mixin _$AppCategoryDTO {
  @JsonKey(ignore: true)
  String? get idCategory => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  List<String>? get listResource => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppCategoryDTOCopyWith<AppCategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCategoryDTOCopyWith<$Res> {
  factory $AppCategoryDTOCopyWith(
          AppCategoryDTO value, $Res Function(AppCategoryDTO) then) =
      _$AppCategoryDTOCopyWithImpl<$Res, AppCategoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? idCategory,
      String nom,
      List<String>? listResource});
}

/// @nodoc
class _$AppCategoryDTOCopyWithImpl<$Res, $Val extends AppCategoryDTO>
    implements $AppCategoryDTOCopyWith<$Res> {
  _$AppCategoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? nom = null,
    Object? listResource = freezed,
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
      listResource: freezed == listResource
          ? _value.listResource
          : listResource // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppCategoryDTOCopyWith<$Res>
    implements $AppCategoryDTOCopyWith<$Res> {
  factory _$$_AppCategoryDTOCopyWith(
          _$_AppCategoryDTO value, $Res Function(_$_AppCategoryDTO) then) =
      __$$_AppCategoryDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? idCategory,
      String nom,
      List<String>? listResource});
}

/// @nodoc
class __$$_AppCategoryDTOCopyWithImpl<$Res>
    extends _$AppCategoryDTOCopyWithImpl<$Res, _$_AppCategoryDTO>
    implements _$$_AppCategoryDTOCopyWith<$Res> {
  __$$_AppCategoryDTOCopyWithImpl(
      _$_AppCategoryDTO _value, $Res Function(_$_AppCategoryDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? nom = null,
    Object? listResource = freezed,
  }) {
    return _then(_$_AppCategoryDTO(
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      listResource: freezed == listResource
          ? _value._listResource
          : listResource // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppCategoryDTO extends _AppCategoryDTO {
  const _$_AppCategoryDTO(
      {@JsonKey(ignore: true) this.idCategory,
      required this.nom,
      final List<String>? listResource})
      : _listResource = listResource,
        super._();

  factory _$_AppCategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AppCategoryDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? idCategory;
  @override
  final String nom;
  final List<String>? _listResource;
  @override
  List<String>? get listResource {
    final value = _listResource;
    if (value == null) return null;
    if (_listResource is EqualUnmodifiableListView) return _listResource;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppCategoryDTO(idCategory: $idCategory, nom: $nom, listResource: $listResource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppCategoryDTO &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            const DeepCollectionEquality()
                .equals(other._listResource, _listResource));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, nom,
      const DeepCollectionEquality().hash(_listResource));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppCategoryDTOCopyWith<_$_AppCategoryDTO> get copyWith =>
      __$$_AppCategoryDTOCopyWithImpl<_$_AppCategoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppCategoryDTOToJson(
      this,
    );
  }
}

abstract class _AppCategoryDTO extends AppCategoryDTO {
  const factory _AppCategoryDTO(
      {@JsonKey(ignore: true) final String? idCategory,
      required final String nom,
      final List<String>? listResource}) = _$_AppCategoryDTO;
  const _AppCategoryDTO._() : super._();

  factory _AppCategoryDTO.fromJson(Map<String, dynamic> json) =
      _$_AppCategoryDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get idCategory;
  @override
  String get nom;
  @override
  List<String>? get listResource;
  @override
  @JsonKey(ignore: true)
  _$$_AppCategoryDTOCopyWith<_$_AppCategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
