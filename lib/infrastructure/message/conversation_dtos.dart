import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'conversation_dtos.freezed.dart';
part 'conversation_dtos.g.dart';

@freezed
abstract class ConversationDTO implements _$ConversationDTO {
  const ConversationDTO._();

  const factory ConversationDTO({
    @JsonKey(ignore: true) String? id,
    String? name,
    int? dateLastMessage,
    bool? isRead,
  }) = _ConversationDTO;

  factory ConversationDTO.fromDomain(Conversation obj) {
    return ConversationDTO(
      id: obj.id.getOrCrash(),
      name: obj.name.getOrCrash(),
      dateLastMessage: obj.dateLastMessage?.millisecondsSinceEpoch,
    );
  }

  Conversation toDomain() {
    return Conversation(
      id: UniqueId.fromUniqueString(id!),
      name: Nom(name ?? 'noname'),
      dateLastMessage: dateLastMessage != null ? DateTime.fromMillisecondsSinceEpoch(dateLastMessage!) : null,
      isRead: isRead,
    );
  }

  factory ConversationDTO.fromJson(Map<String, dynamic> json) => _$ConversationDTOFromJson(json);

  factory ConversationDTO.fromFirestore(DocumentSnapshot doc) {
    return ConversationDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
