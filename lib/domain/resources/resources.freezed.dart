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
  String get documentPath => throw _privateConstructorUsedError;
  UniqueId get idCategory => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res, Resource>;
  @useResult
  $Res call({UniqueId id, String documentPath, UniqueId idCategory, String keyword, String description});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res, $Val extends Resource> implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResourcesCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$$_ResourcesCopyWith(_$_Resources value, $Res Function(_$_Resources) then) =
      __$$_ResourcesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, String documentPath, UniqueId idCategory, String keyword, String description});
}

/// @nodoc
class __$$_ResourcesCopyWithImpl<$Res> extends _$ResourceCopyWithImpl<$Res, _$_Resources>
    implements _$$_ResourcesCopyWith<$Res> {
  __$$_ResourcesCopyWithImpl(_$_Resources _value, $Res Function(_$_Resources) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentPath = null,
    Object? idCategory = null,
    Object? keyword = null,
    Object? description = null,
  }) {
    return _then(_$_Resources(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Resources extends _Resources {
  const _$_Resources(
      {required this.id,
      required this.documentPath,
      required this.idCategory,
      required this.keyword,
      required this.description})
      : super._();

  @override
  final UniqueId id;
  @override
  final String documentPath;
  @override
  final UniqueId idCategory;
  @override
  final String keyword;
  @override
  final String description;

  @override
  String toString() {
    return 'Resource(id: $id, documentPath: $documentPath, idCategory: $idCategory, keyword: $keyword, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Resources &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentPath, documentPath) || other.documentPath == documentPath) &&
            (identical(other.idCategory, idCategory) || other.idCategory == idCategory) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.description, description) || other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, documentPath, idCategory, keyword, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResourcesCopyWith<_$_Resources> get copyWith =>
      __$$_ResourcesCopyWithImpl<_$_Resources>(this, _$identity);
}

abstract class _Resources extends Resource {
  const factory _Resources(
      {required final UniqueId id,
      required final String documentPath,
      required final UniqueId idCategory,
      required final String keyword,
      required final String description}) = _$_Resources;
  const _Resources._() : super._();

  @override
  UniqueId get id;
  @override
  String get documentPath;
  @override
  UniqueId get idCategory;
  @override
  String get keyword;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ResourcesCopyWith<_$_Resources> get copyWith => throw _privateConstructorUsedError;
}
