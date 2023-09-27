import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'conversation.freezed.dart';

@freezed
abstract class Conversation with _$Conversation {
  const Conversation._();

  const factory Conversation({
    required UniqueId id,
    required Nom name,
    required int? dateLastMessage,
  }) = _Conversation;

  factory Conversation.empty() => Conversation(
        id: UniqueId(),
        name: Nom(''),
        dateLastMessage: null,
      );
}
