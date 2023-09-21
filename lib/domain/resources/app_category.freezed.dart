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
      List<Resource>? listResource});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppCategoryCopyWith<$Res>
    implements $AppCategoryCopyWith<$Res> {
  factory _$$_AppCategoryCopyWith(
          _$_AppCategory value, $Res Function(_$_AppCategory) then) =
      __$$_AppCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Nom nom,
      Either<AppCategoryFailure, List<AppCategory>>? subcategory,
      String path,
      List<Resource>? listResource});
}

/// @nodoc
class __$$_AppCategoryCopyWithImpl<$Res>
    extends _$AppCategoryCopyWithImpl<$Res, _$_AppCategory>
    implements _$$_AppCategoryCopyWith<$Res> {
  __$$_AppCategoryCopyWithImpl(
      _$_AppCategory _value, $Res Function(_$_AppCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? subcategory = freezed,
    Object? path = null,
    Object? listResource = freezed,
  }) {
    return _then(_$_AppCategory(
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
    ));
  }
}

/// @nodoc

class _$_AppCategory extends _AppCategory {
  const _$_AppCategory(
      {required this.id,
      required this.nom,
      required this.subcategory,
      required this.path,
      final List<Resource>? listResource})
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

  @override
  String toString() {
    return 'AppCategory(id: $id, nom: $nom, subcategory: $subcategory, path: $path, listResource: $listResource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._listResource, _listResource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nom, subcategory, path,
      const DeepCollectionEquality().hash(_listResource));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppCategoryCopyWith<_$_AppCategory> get copyWith =>
      __$$_AppCategoryCopyWithImpl<_$_AppCategory>(this, _$identity);
}

abstract class _AppCategory extends AppCategory {
  const factory _AppCategory(
      {required final UniqueId id,
      required final Nom nom,
      required final Either<AppCategoryFailure, List<AppCategory>>? subcategory,
      required final String path,
      final List<Resource>? listResource}) = _$_AppCategory;
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
  @JsonKey(ignore: true)
  _$$_AppCategoryCopyWith<_$_AppCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
