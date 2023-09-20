import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/failures.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_validators.dart';

/// Question pour les choix dans l'assistant diagostique
@immutable
class Question extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Question(String input) {
    return Question._(validateMaxStringLengthAndNoNull(input, 200));
  }

  const Question._(this.value);
}

/// Question pour les choix dans l'assistant diagostique
@immutable
class Anwser extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Anwser(String input) {
    return Anwser._(validateMaxStringLengthAndNoNull(input, 1000));
  }

  const Anwser._(this.value);
}
