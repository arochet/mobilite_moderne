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

extension ResourceFailureX on ResourceFailure {
  String get message {
    return map(
      unexpected: (_) => 'Resource : Unexpected error',
      insufficientPermission: (_) => 'Resource : Insufficient permissions',
      unableToUpdate: (_) => 'Resource :  Impossible to update',
      unableToLoadFile: (_) => 'Resource : Impossible to load file',
      notExist: (_) => 'La resource n\'existe pas',
    );
  }
}
