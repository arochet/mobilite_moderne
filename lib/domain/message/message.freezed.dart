// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Message {
  UniqueId get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Lorsque l'on envoie l'image dans le chat
  XFile? get imageSend => throw _privateConstructorUsedError;

  /// Lorsque l'on charge l'image depuis Storage pour l'afficher dans le chat
  Future<Uint8List?>? get imageRead => throw _privateConstructorUsedError;

  /// Chemin de l'image dans Storage
  String? get imagePath => throw _privateConstructorUsedError;
  UniqueId get idUser => throw _privateConstructorUsedError;

  /// Image URL pour le web
  Future<String>? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {UniqueId id,
      String? text,
      DateTime date,
      XFile? imageSend,
      Future<Uint8List?>? imageRead,
      String? imagePath,
      UniqueId idUser,
      Future<String>? imageUrl});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? date = null,
    Object? imageSend = freezed,
    Object? imageRead = freezed,
    Object? imagePath = freezed,
    Object? idUser = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageSend: freezed == imageSend
          ? _value.imageSend
          : imageSend // ignore: cast_nullable_to_non_nullable
              as XFile?,
      imageRead: freezed == imageRead
          ? _value.imageRead
          : imageRead // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      String? text,
      DateTime date,
      XFile? imageSend,
      Future<Uint8List?>? imageRead,
      String? imagePath,
      UniqueId idUser,
      Future<String>? imageUrl});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? date = null,
    Object? imageSend = freezed,
    Object? imageRead = freezed,
    Object? imagePath = freezed,
    Object? idUser = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Message(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageSend: freezed == imageSend
          ? _value.imageSend
          : imageSend // ignore: cast_nullable_to_non_nullable
              as XFile?,
      imageRead: freezed == imageRead
          ? _value.imageRead
          : imageRead // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List?>?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Future<String>?,
    ));
  }
}

/// @nodoc

class _$_Message extends _Message {
  const _$_Message(
      {required this.id,
      required this.text,
      required this.date,
      required this.imageSend,
      required this.imageRead,
      required this.imagePath,
      required this.idUser,
      this.imageUrl})
      : super._();

  @override
  final UniqueId id;
  @override
  final String? text;
  @override
  final DateTime date;

  /// Lorsque l'on envoie l'image dans le chat
  @override
  final XFile? imageSend;

  /// Lorsque l'on charge l'image depuis Storage pour l'afficher dans le chat
  @override
  final Future<Uint8List?>? imageRead;

  /// Chemin de l'image dans Storage
  @override
  final String? imagePath;
  @override
  final UniqueId idUser;

  /// Image URL pour le web
  @override
  final Future<String>? imageUrl;

  @override
  String toString() {
    return 'Message(id: $id, text: $text, date: $date, imageSend: $imageSend, imageRead: $imageRead, imagePath: $imagePath, idUser: $idUser, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imageSend, imageSend) ||
                other.imageSend == imageSend) &&
            (identical(other.imageRead, imageRead) ||
                other.imageRead == imageRead) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, date, imageSend,
      imageRead, imagePath, idUser, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);
}

abstract class _Message extends Message {
  const factory _Message(
      {required final UniqueId id,
      required final String? text,
      required final DateTime date,
      required final XFile? imageSend,
      required final Future<Uint8List?>? imageRead,
      required final String? imagePath,
      required final UniqueId idUser,
      final Future<String>? imageUrl}) = _$_Message;
  const _Message._() : super._();

  @override
  UniqueId get id;
  @override
  String? get text;
  @override
  DateTime get date;
  @override

  /// Lorsque l'on envoie l'image dans le chat
  XFile? get imageSend;
  @override

  /// Lorsque l'on charge l'image depuis Storage pour l'afficher dans le chat
  Future<Uint8List?>? get imageRead;
  @override

  /// Chemin de l'image dans Storage
  String? get imagePath;
  @override
  UniqueId get idUser;
  @override

  /// Image URL pour le web
  Future<String>? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
