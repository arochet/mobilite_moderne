import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_failure.freezed.dart';

@freezed
abstract class NewsFailure with _$NewsFailure {
  const factory NewsFailure.unexpected() = _Unexpected;
  const factory NewsFailure.insufficientPermission() = _InsufficientPermission;
  const factory NewsFailure.unableToUpdate() = _UnableToUpdate;
}
