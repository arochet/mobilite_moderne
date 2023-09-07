import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/failures.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_validators.dart';

/// Nom de l'utilisateur
@immutable
class Nom extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Nom(String input) {
    return Nom._(validateMaxStringLengthAndNoNull(input, 50));
  }

  const Nom._(this.value);
}

/// Numéro de téléphone valide
@immutable
class Telephone extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Telephone(String input) {
    return Telephone._(validateTelephone(input));
  }

  const Telephone._(this.value);
}

/// Adresse email valide
@immutable
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

/// Mot de passe valide
@immutable
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

/// Confirmation du mot de passe valide
@immutable
class PasswordConfirmation extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PasswordConfirmation(String input, String input2) {
    return PasswordConfirmation._(validatePasswordConfirmation(input, input2));
  }

  const PasswordConfirmation._(this.value);
}

/// Type de compte (email, google, échec)
enum TypeAccountState { email, google, fail }

extension ParseToSringTA on TypeAccountState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    return this.toString().substring(17);
  }
}

/// Type de compte (email, google, échec)<br>
/// Type avec TypeAccountState
@immutable
class TypeAccount extends ValueObject<TypeAccountState> {
  @override
  final Either<ValueFailure<TypeAccountState>, TypeAccountState> value;

  factory TypeAccount(TypeAccountState input) {
    return TypeAccount._(right(input));
  }

  factory TypeAccount.fromString(String input) {
    try {
      final TypeAccountState? state = TypeAccountState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null)
        return TypeAccount._(left(ValueFailure.invalidEnum(failedValue: TypeAccountState.fail)));
      return TypeAccount._(right(state));
    } catch (e) {
      return TypeAccount._(left(ValueFailure.invalidEnum(failedValue: TypeAccountState.fail)));
    }
  }

  const TypeAccount._(this.value);
}
