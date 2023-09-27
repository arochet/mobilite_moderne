import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const Message._();

  const factory Message({
    required UniqueId id,
    required String text,
    required DateTime date,
    required String image,
    required UniqueId idUser,
  }) = _Message;

  factory Message.empty() => Message(
        id: UniqueId(),
        text: '',
        date: DateTime.now(),
        image: '',
        idUser: UniqueId(),
      );
}
