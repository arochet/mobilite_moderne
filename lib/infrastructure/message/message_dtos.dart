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
    required String? image,
    required String? imagePath,
    required String idUser,
  }) = _MessageDTO;

  factory MessageDTO.fromDomain(Message obj, UniqueId? idUser, String? imagePath) {
    return MessageDTO(
      id: obj.id.getOrCrash(),
      text: obj.text,
      date: obj.date.millisecondsSinceEpoch,
      image: null,
      imagePath: imagePath ?? obj.imagePath,
      idUser: idUser?.getOrCrash() ?? obj.idUser.getOrCrash(),
    );
  }

  Message toDomain(Future<Uint8List?>? imageRead) {
    return Message(
      id: UniqueId.fromUniqueString(id!),
      text: text,
      date: DateTime.fromMillisecondsSinceEpoch(date),
      imageRead: imageRead,
      imageSend: null,
      imagePath: imagePath,
      idUser: UniqueId.fromUniqueString(idUser),
    );
  }

  factory MessageDTO.fromJson(Map<String, dynamic> json) => _$MessageDTOFromJson(json);

  factory MessageDTO.fromFirestore(DocumentSnapshot doc) {
    return MessageDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
