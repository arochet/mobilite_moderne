// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageDTO _$MessageDTOFromJson(Map<String, dynamic> json) {
  return _MessageDTO.fromJson(json);
}

/// @nodoc
mixin _$MessageDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDTOCopyWith<MessageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDTOCopyWith<$Res> {
  factory $MessageDTOCopyWith(
          MessageDTO value, $Res Function(MessageDTO) then) =
      _$MessageDTOCopyWithImpl<$Res, MessageDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? text,
      int date,
      String? image,
      String? imagePath,
      String idUser});
}

/// @nodoc
class _$MessageDTOCopyWithImpl<$Res, $Val extends MessageDTO>
    implements $MessageDTOCopyWith<$Res> {
  _$MessageDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? date = null,
    Object? image = freezed,
    Object? imagePath = freezed,
    Object? idUser = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageDTOCopyWith<$Res>
    implements $MessageDTOCopyWith<$Res> {
  factory _$$_MessageDTOCopyWith(
          _$_MessageDTO value, $Res Function(_$_MessageDTO) then) =
      __$$_MessageDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? text,
      int date,
      String? image,
      String? imagePath,
      String idUser});
}

/// @nodoc
class __$$_MessageDTOCopyWithImpl<$Res>
    extends _$MessageDTOCopyWithImpl<$Res, _$_MessageDTO>
    implements _$$_MessageDTOCopyWith<$Res> {
  __$$_MessageDTOCopyWithImpl(
      _$_MessageDTO _value, $Res Function(_$_MessageDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? date = null,
    Object? image = freezed,
    Object? imagePath = freezed,
    Object? idUser = null,
  }) {
    return _then(_$_MessageDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageDTO extends _MessageDTO {
  const _$_MessageDTO(
      {@JsonKey(ignore: true) this.id,
      required this.text,
      required this.date,
      required this.image,
      required this.imagePath,
      required this.idUser})
      : super._();

  factory _$_MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? text;
  @override
  final int date;
  @override
  final String? image;
  @override
  final String? imagePath;
  @override
  final String idUser;

  @override
  String toString() {
    return 'MessageDTO(id: $id, text: $text, date: $date, image: $image, imagePath: $imagePath, idUser: $idUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.idUser, idUser) || other.idUser == idUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, text, date, image, imagePath, idUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDTOCopyWith<_$_MessageDTO> get copyWith =>
      __$$_MessageDTOCopyWithImpl<_$_MessageDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDTOToJson(
      this,
    );
  }
}

abstract class _MessageDTO extends MessageDTO {
  const factory _MessageDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String? text,
      required final int date,
      required final String? image,
      required final String? imagePath,
      required final String idUser}) = _$_MessageDTO;
  const _MessageDTO._() : super._();

  factory _MessageDTO.fromJson(Map<String, dynamic> json) =
      _$_MessageDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get text;
  @override
  int get date;
  @override
  String? get image;
  @override
  String? get imagePath;
  @override
  String get idUser;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDTOCopyWith<_$_MessageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
