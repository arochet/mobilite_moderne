import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/core/failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLenght(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateMaxStringLengthAndNoNull(String input, int maxLength) {
  if (input.length <= maxLength && input.length > 0) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLenghtOrNull(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateTelephone(String input) {
  const telephoneRegex =
      r"""^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$""";
  if (RegExp(telephoneRegex).hasMatch(input) || input.length == 0) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePasswordConfirmation(String input, String input2) {
  if (input == input2) {
    return right(input);
  } else {
    return left(ValueFailure.confirmationPasswordFail(failedValue: input));
  }
}
