// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserAuth {
  UniqueId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthCopyWith<UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthCopyWith<$Res> {
  factory $UserAuthCopyWith(UserAuth value, $Res Function(UserAuth) then) =
      _$UserAuthCopyWithImpl<$Res, UserAuth>;
  @useResult
  $Res call({UniqueId id});
}

/// @nodoc
class _$UserAuthCopyWithImpl<$Res, $Val extends UserAuth>
    implements $UserAuthCopyWith<$Res> {
  _$UserAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAuthImplCopyWith<$Res>
    implements $UserAuthCopyWith<$Res> {
  factory _$$UserAuthImplCopyWith(
          _$UserAuthImpl value, $Res Function(_$UserAuthImpl) then) =
      __$$UserAuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id});
}

/// @nodoc
class __$$UserAuthImplCopyWithImpl<$Res>
    extends _$UserAuthCopyWithImpl<$Res, _$UserAuthImpl>
    implements _$$UserAuthImplCopyWith<$Res> {
  __$$UserAuthImplCopyWithImpl(
      _$UserAuthImpl _value, $Res Function(_$UserAuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserAuthImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$UserAuthImpl implements _UserAuth {
  const _$UserAuthImpl({required this.id});

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'UserAuth(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthImplCopyWith<_$UserAuthImpl> get copyWith =>
      __$$UserAuthImplCopyWithImpl<_$UserAuthImpl>(this, _$identity);
}

abstract class _UserAuth implements UserAuth {
  const factory _UserAuth({required final UniqueId id}) = _$UserAuthImpl;

  @override
  UniqueId get id;
  @override
  @JsonKey(ignore: true)
  _$$UserAuthImplCopyWith<_$UserAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
