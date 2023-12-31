// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationDTO _$ConversationDTOFromJson(Map<String, dynamic> json) {
  return _ConversationDTO.fromJson(json);
}

/// @nodoc
mixin _$ConversationDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get dateLastMessage => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationDTOCopyWith<ConversationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationDTOCopyWith<$Res> {
  factory $ConversationDTOCopyWith(
          ConversationDTO value, $Res Function(ConversationDTO) then) =
      _$ConversationDTOCopyWithImpl<$Res, ConversationDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? name,
      int? dateLastMessage,
      bool? isRead});
}

/// @nodoc
class _$ConversationDTOCopyWithImpl<$Res, $Val extends ConversationDTO>
    implements $ConversationDTOCopyWith<$Res> {
  _$ConversationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dateLastMessage = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dateLastMessage: freezed == dateLastMessage
          ? _value.dateLastMessage
          : dateLastMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationDTOImplCopyWith<$Res>
    implements $ConversationDTOCopyWith<$Res> {
  factory _$$ConversationDTOImplCopyWith(_$ConversationDTOImpl value,
          $Res Function(_$ConversationDTOImpl) then) =
      __$$ConversationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? name,
      int? dateLastMessage,
      bool? isRead});
}

/// @nodoc
class __$$ConversationDTOImplCopyWithImpl<$Res>
    extends _$ConversationDTOCopyWithImpl<$Res, _$ConversationDTOImpl>
    implements _$$ConversationDTOImplCopyWith<$Res> {
  __$$ConversationDTOImplCopyWithImpl(
      _$ConversationDTOImpl _value, $Res Function(_$ConversationDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dateLastMessage = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_$ConversationDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dateLastMessage: freezed == dateLastMessage
          ? _value.dateLastMessage
          : dateLastMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationDTOImpl extends _ConversationDTO {
  const _$ConversationDTOImpl(
      {@JsonKey(ignore: true) this.id,
      this.name,
      this.dateLastMessage,
      this.isRead})
      : super._();

  factory _$ConversationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationDTOImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? name;
  @override
  final int? dateLastMessage;
  @override
  final bool? isRead;

  @override
  String toString() {
    return 'ConversationDTO(id: $id, name: $name, dateLastMessage: $dateLastMessage, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateLastMessage, dateLastMessage) ||
                other.dateLastMessage == dateLastMessage) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, dateLastMessage, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationDTOImplCopyWith<_$ConversationDTOImpl> get copyWith =>
      __$$ConversationDTOImplCopyWithImpl<_$ConversationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationDTOImplToJson(
      this,
    );
  }
}

abstract class _ConversationDTO extends ConversationDTO {
  const factory _ConversationDTO(
      {@JsonKey(ignore: true) final String? id,
      final String? name,
      final int? dateLastMessage,
      final bool? isRead}) = _$ConversationDTOImpl;
  const _ConversationDTO._() : super._();

  factory _ConversationDTO.fromJson(Map<String, dynamic> json) =
      _$ConversationDTOImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get name;
  @override
  int? get dateLastMessage;
  @override
  bool? get isRead;
  @override
  @JsonKey(ignore: true)
  _$$ConversationDTOImplCopyWith<_$ConversationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
