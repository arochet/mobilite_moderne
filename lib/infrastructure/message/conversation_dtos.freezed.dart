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
      {@JsonKey(ignore: true) String? id, String? name, int? dateLastMessage});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConversationDTOCopyWith<$Res>
    implements $ConversationDTOCopyWith<$Res> {
  factory _$$_ConversationDTOCopyWith(
          _$_ConversationDTO value, $Res Function(_$_ConversationDTO) then) =
      __$$_ConversationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id, String? name, int? dateLastMessage});
}

/// @nodoc
class __$$_ConversationDTOCopyWithImpl<$Res>
    extends _$ConversationDTOCopyWithImpl<$Res, _$_ConversationDTO>
    implements _$$_ConversationDTOCopyWith<$Res> {
  __$$_ConversationDTOCopyWithImpl(
      _$_ConversationDTO _value, $Res Function(_$_ConversationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dateLastMessage = freezed,
  }) {
    return _then(_$_ConversationDTO(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConversationDTO extends _ConversationDTO {
  const _$_ConversationDTO(
      {@JsonKey(ignore: true) this.id, this.name, this.dateLastMessage})
      : super._();

  factory _$_ConversationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? name;
  @override
  final int? dateLastMessage;

  @override
  String toString() {
    return 'ConversationDTO(id: $id, name: $name, dateLastMessage: $dateLastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateLastMessage, dateLastMessage) ||
                other.dateLastMessage == dateLastMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, dateLastMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConversationDTOCopyWith<_$_ConversationDTO> get copyWith =>
      __$$_ConversationDTOCopyWithImpl<_$_ConversationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationDTOToJson(
      this,
    );
  }
}

abstract class _ConversationDTO extends ConversationDTO {
  const factory _ConversationDTO(
      {@JsonKey(ignore: true) final String? id,
      final String? name,
      final int? dateLastMessage}) = _$_ConversationDTO;
  const _ConversationDTO._() : super._();

  factory _ConversationDTO.fromJson(Map<String, dynamic> json) =
      _$_ConversationDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get name;
  @override
  int? get dateLastMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ConversationDTOCopyWith<_$_ConversationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
