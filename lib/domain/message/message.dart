import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const Message._();

  const factory Message({
    required UniqueId id,
    required String? text,
    required DateTime date,

    /// Lorsque l'on envoie l'image dans le chat
    required XFile? imageSend,

    /// Lorsque l'on charge l'image depuis Storage pour l'afficher dans le chat
    required Future<Uint8List?>? imageRead,

    /// Chemin de l'image dans Storage
    required String? imagePath,
    required UniqueId idUser,

    /// Image URL pour le web
    Future<String>? imageUrl,
  }) = _Message;

  factory Message.empty() => Message(
        id: UniqueId(),
        text: null,
        date: DateTime.now(),
        imageRead: null,
        imageSend: null,
        imagePath: null,
        idUser: UniqueId(),
      );
}
