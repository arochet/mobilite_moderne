import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/failures.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_validators.dart';

/// Nom de l'utilisateur
@immutable
class AppTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AppTitle(String input) {
    return AppTitle._(validateMaxStringLengthAndNoNull(input, 200));
  }

  const AppTitle._(this.value);
}
