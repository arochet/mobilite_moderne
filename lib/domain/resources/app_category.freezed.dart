// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppCategory {
  UniqueId get id => throw _privateConstructorUsedError;

  /// Nom d'affichage de la catégorie
  Nom get nom => throw _privateConstructorUsedError;

  /// Les sous catégories de la catégories, remplis dans le repository
  Either<AppCategoryFailure, List<AppCategory>>? get subcategory =>
      throw _privateConstructorUsedError;

  /// Chemin de la catégorie pour y accéder dans FireStore. Exemple : MLKDJEL/subcategory/qLKLJKD
  String get path => throw _privateConstructorUsedError;

  /// Liste des documents reliés à la catégorie
  List<Resource>? get listResource => throw _privateConstructorUsedError;

  /// Si la catégorie a des sous catégories (peut avoir des sous catégory maus subcategory n'est pas alimenté )
  bool get hasSubCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppCategoryCopyWith<AppCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCategoryCopyWith<$Res> {
  factory $AppCategoryCopyWith(
          AppCategory value, $Res Function(AppCategory) then) =
      _$AppCategoryCopyWithImpl<$Res, AppCategory>;
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      Either<AppCategoryFailure, List<AppCategory>>? subcategory,
      String path,
      List<Resource>? listResource,
      bool hasSubCategory});
}

/// @nodoc
class _$AppCategoryCopyWithImpl<$Res, $Val extends AppCategory>
    implements $AppCategoryCopyWith<$Res> {
  _$AppCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? subcategory = freezed,
    Object? path = null,
    Object? listResource = freezed,
    Object? hasSubCategory = null,
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
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Either<AppCategoryFailure, List<AppCategory>>?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      listResource: freezed == listResource
          ? _value.listResource
          : listResource // ignore: cast_nullable_to_non_nullable
              as List<Resource>?,
      hasSubCategory: null == hasSubCategory
          ? _value.hasSubCategory
          : hasSubCategory // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppCategoryImplCopyWith<$Res>
    implements $AppCategoryCopyWith<$Res> {
  factory _$$AppCategoryImplCopyWith(
          _$AppCategoryImpl value, $Res Function(_$AppCategoryImpl) then) =
      __$$AppCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      Either<AppCategoryFailure, List<AppCategory>>? subcategory,
      String path,
      List<Resource>? listResource,
      bool hasSubCategory});
}

/// @nodoc
class __$$AppCategoryImplCopyWithImpl<$Res>
    extends _$AppCategoryCopyWithImpl<$Res, _$AppCategoryImpl>
    implements _$$AppCategoryImplCopyWith<$Res> {
  __$$AppCategoryImplCopyWithImpl(
      _$AppCategoryImpl _value, $Res Function(_$AppCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? subcategory = freezed,
    Object? path = null,
    Object? listResource = freezed,
    Object? hasSubCategory = null,
  }) {
    return _then(_$AppCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as Nom,
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Either<AppCategoryFailure, List<AppCategory>>?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      listResource: freezed == listResource
          ? _value._listResource
          : listResource // ignore: cast_nullable_to_non_nullable
              as List<Resource>?,
      hasSubCategory: null == hasSubCategory
          ? _value.hasSubCategory
          : hasSubCategory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppCategoryImpl extends _AppCategory {
  const _$AppCategoryImpl(
      {required this.id,
      required this.nom,
      required this.subcategory,
      required this.path,
      final List<Resource>? listResource,
      required this.hasSubCategory})
      : _listResource = listResource,
        super._();

  @override
  final UniqueId id;

  /// Nom d'affichage de la catégorie
  @override
  final Nom nom;

  /// Les sous catégories de la catégories, remplis dans le repository
  @override
  final Either<AppCategoryFailure, List<AppCategory>>? subcategory;

  /// Chemin de la catégorie pour y accéder dans FireStore. Exemple : MLKDJEL/subcategory/qLKLJKD
  @override
  final String path;

  /// Liste des documents reliés à la catégorie
  final List<Resource>? _listResource;

  /// Liste des documents reliés à la catégorie
  @override
  List<Resource>? get listResource {
    final value = _listResource;
    if (value == null) return null;
    if (_listResource is EqualUnmodifiableListView) return _listResource;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Si la catégorie a des sous catégories (peut avoir des sous catégory maus subcategory n'est pas alimenté )
  @override
  final bool hasSubCategory;

  @override
  String toString() {
    return 'AppCategory(id: $id, nom: $nom, subcategory: $subcategory, path: $path, listResource: $listResource, hasSubCategory: $hasSubCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._listResource, _listResource) &&
            (identical(other.hasSubCategory, hasSubCategory) ||
                other.hasSubCategory == hasSubCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nom, subcategory, path,
      const DeepCollectionEquality().hash(_listResource), hasSubCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppCategoryImplCopyWith<_$AppCategoryImpl> get copyWith =>
      __$$AppCategoryImplCopyWithImpl<_$AppCategoryImpl>(this, _$identity);
}

abstract class _AppCategory extends AppCategory {
  const factory _AppCategory(
      {required final UniqueId id,
      required final Nom nom,
      required final Either<AppCategoryFailure, List<AppCategory>>? subcategory,
      required final String path,
      final List<Resource>? listResource,
      required final bool hasSubCategory}) = _$AppCategoryImpl;
  const _AppCategory._() : super._();

  @override
  UniqueId get id;
  @override

  /// Nom d'affichage de la catégorie
  Nom get nom;
  @override

  /// Les sous catégories de la catégories, remplis dans le repository
  Either<AppCategoryFailure, List<AppCategory>>? get subcategory;
  @override

  /// Chemin de la catégorie pour y accéder dans FireStore. Exemple : MLKDJEL/subcategory/qLKLJKD
  String get path;
  @override

  /// Liste des documents reliés à la catégorie
  List<Resource>? get listResource;
  @override

  /// Si la catégorie a des sous catégories (peut avoir des sous catégory maus subcategory n'est pas alimenté )
  bool get hasSubCategory;
  @override
  @JsonKey(ignore: true)
  _$$AppCategoryImplCopyWith<_$AppCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
