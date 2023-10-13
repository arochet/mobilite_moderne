import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidPhoneNumber({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.confirmationPasswordFail({
    required T failedValue,
  }) = ConfirmationPasswordFail<T>;
  const factory ValueFailure.exceedingLenght({
    required T failedValue,
    required int max,
  }) = ExceedingLenght<T>;
  const factory ValueFailure.exceedingLenghtOrNull({
    required T failedValue,
    required int max,
  }) = ExceedingLenghtOrNull<T>;
  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int maxLength,
  }) = ListTooLong<T>;
  const factory ValueFailure.invalidEnum({
    required T failedValue,
  }) = InvalidEnum<T>;
  const factory ValueFailure.invalidPostalCode({
    required T failedValue,
  }) = InvalidPostalCode<T>;
}
