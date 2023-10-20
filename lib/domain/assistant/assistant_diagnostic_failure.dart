import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistant_diagnostic_failure.freezed.dart';

@freezed
abstract class AssistantDiagnosticFailure with _$AssistantDiagnosticFailure {
  const factory AssistantDiagnosticFailure.unexpected() = _Unexpected;
  const factory AssistantDiagnosticFailure.insufficientPermission() = _InsufficientPermission;
  const factory AssistantDiagnosticFailure.unableToUpdate() = _UnableToUpdate;
}
