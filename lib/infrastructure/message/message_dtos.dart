import 'dart:typed_data';

import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_dtos.freezed.dart';
part 'message_dtos.g.dart';

@freezed
abstract class MessageDTO implements _$MessageDTO {
  const MessageDTO._();

  const factory MessageDTO({
    @JsonKey(ignore: true) String? id,
    required String? text,
    required int date,
    required String? imagePath,
    required String? videoPath,
    required String idUser,
  }) = _MessageDTO;

  factory MessageDTO.fromDomain(Message obj, UniqueId? idUser, String? imagePath, String? videoPath) {
    return MessageDTO(
      id: obj.id.getOrCrash(),
      text: obj.text,
      date: obj.date.millisecondsSinceEpoch,
      imagePath: imagePath ?? obj.imagePath,
      videoPath: videoPath ?? obj.videoPath,
      idUser: idUser?.getOrCrash() ?? obj.idUser.getOrCrash(),
    );
  }

  Message toDomain({Future<Uint8List?>? imageBytes, Future<String>? imageUrl}) {
    return Message(
      id: UniqueId.fromUniqueString(id!),
      text: text,
      date: DateTime.fromMillisecondsSinceEpoch(date),
      imageRead: imageBytes,
      imageUrl: imageUrl,
      imageSend: null,
      imagePath: imagePath,
      videoPath: videoPath,
      idUser: UniqueId.fromUniqueString(idUser),
      videoSend: null,
    );
  }

  factory MessageDTO.fromJson(Map<String, dynamic> json) => _$MessageDTOFromJson(json);

  factory MessageDTO.fromFirestore(DocumentSnapshot doc) {
    return MessageDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
