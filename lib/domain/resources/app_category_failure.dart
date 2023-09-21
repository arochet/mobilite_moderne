import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_category_failure.freezed.dart';

@freezed
abstract class AppCategoryFailure with _$AppCategoryFailure {
  const factory AppCategoryFailure.unexpected() = _Unexpected;
  const factory AppCategoryFailure.insufficientPermission() = _InsufficientPermission;
  const factory AppCategoryFailure.unableToUpdate() = _UnableToUpdate;
}
