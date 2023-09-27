import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_failure.freezed.dart';

@freezed
abstract class ResourceFailure with _$ResourceFailure {
  const factory ResourceFailure.unexpected() = _Unexpected;
  const factory ResourceFailure.insufficientPermission() = _InsufficientPermission;
  const factory ResourceFailure.unableToUpdate() = _UnableToUpdate;
  const factory ResourceFailure.unableToLoadFile() = _UnableToLoadFile;
  const factory ResourceFailure.notExist() = _NotExist;
}
