import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_failure.freezed.dart';

@freezed
abstract class ArticleFailure with _$ArticleFailure {
  const factory ArticleFailure.unexpected() = _Unexpected;
  const factory ArticleFailure.insufficientPermission() = _InsufficientPermission;
  const factory ArticleFailure.unableToUpdate() = _UnableToUpdate;
}
