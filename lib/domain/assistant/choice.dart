import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/assistant/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';

part 'choice.freezed.dart';

/// Dans la page Assistant Diagnostique, on pose des questions à l'utilisateur
/// Un choix est une question / réponse
@freezed
abstract class ChoiceWithQuestions with _$ChoiceWithQuestions {
  const ChoiceWithQuestions._();

  const factory ChoiceWithQuestions({
    required UniqueId id,
    required Nom nom,
    required Question question,
    required String path,
    required List<ChoiceWithQuestions>? choiceQuestion,
    required List<ChoiceWithAnswer>? choiceAnswer,
  }) = _ChoiceWithQuestions;

  factory ChoiceWithQuestions.empty() => ChoiceWithQuestions(
        id: UniqueId(),
        nom: Nom(''),
        path: '',
        question: Question(''),
        choiceQuestion: [],
        choiceAnswer: null,
      );
}

/// Dans la page Assistant Diagnostique, on pose des questions à l'utilisateur
/// Il obtiens un moment une réponse avec les ressources nécessaires
@freezed
abstract class ChoiceWithAnswer with _$ChoiceWithAnswer {
  const ChoiceWithAnswer._();

  const factory ChoiceWithAnswer({
    required UniqueId id,
    required Nom nom,

    /// Chemin du choix dans Firebase
    required String path,
    required Anwser answer,

    /// Liste des ressources qui sont liées à ce choix (PDF ...)
    required List<Resource> listRessources,
  }) = _ChoiceWithAnswer;

  factory ChoiceWithAnswer.empty() => ChoiceWithAnswer(
        id: UniqueId(),
        nom: Nom(''),
        path: '',
        answer: Anwser(''),
        listRessources: [],
      );

  factory ChoiceWithAnswer.test() => ChoiceWithAnswer(
        id: UniqueId.fromUniqueString('choix2'),
        nom: Nom('Réponse 2 test'),
        path: 'choice/votredemandeconcerne/answer/veloelectrique/answer/choix2/answer/choix2',
        answer: Anwser('piapiapia'),
        listRessources: [],
      );
}
