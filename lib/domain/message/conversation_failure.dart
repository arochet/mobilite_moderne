import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_failure.freezed.dart';

@freezed
abstract class ConversationFailure with _$ConversationFailure {
  const factory ConversationFailure.unexpected() = _Unexpected;
  const factory ConversationFailure.insufficientPermission() = _InsufficientPermission;
  const factory ConversationFailure.unableToUpdate() = _UnableToUpdate;
}
