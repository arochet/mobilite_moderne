import 'package:mobilite_moderne/DOMAIN/assistant/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/assistant/choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
part 'choice_dtos.freezed.dart';
part 'choice_dtos.g.dart';

@freezed
abstract class ChoiceDTO implements _$ChoiceDTO {
  const ChoiceDTO._();

  const factory ChoiceDTO({
    @JsonKey(ignore: true) String? id,
    required String nom,
    required String? question,
    required String? answer,
    required List<String>? listRessources,
  }) = _ChoiceDTO;

  factory ChoiceDTO.fromQuestionDomain(ChoiceWithQuestions obj) {
    return ChoiceDTO(
      id: obj.id.getOrCrash(),
      nom: obj.nom.getOrCrash(),
      question: obj.question?.getOrCrash(),
      answer: null,
      listRessources: null,
    );
  }

  ChoiceWithQuestions toDomain(List<ChoiceDTO>? listChoixDTO, String path) {
    List<ChoiceWithQuestions> choiceQuestion = [];
    List<ChoiceWithAnswer> choiceAnswer = [];

    if (listChoixDTO == null) {
      return ChoiceWithQuestions(
        id: UniqueId.fromUniqueString(id!),
        nom: Nom(nom),
        path: path,
        question: Question(question!),
        choiceQuestion: null,
        choiceAnswer: null,
      );
    }

    //On parcours la liste des choix
    for (var i = 0; i < listChoixDTO.length; i++) {
      if (listChoixDTO[i].question != null) {
        choiceQuestion.add(listChoixDTO[i].toDomain(null, '$path/answer/${listChoixDTO[i].id}'));
      } else {
        choiceAnswer.add(listChoixDTO[i].toDomainAnswer('$path/answer/${listChoixDTO[i].id}'));
      }
    }

    return ChoiceWithQuestions(
      id: UniqueId.fromUniqueString(id!),
      nom: Nom(nom),
      path: path,
      question: Question(question!),
      choiceQuestion: choiceQuestion,
      choiceAnswer: choiceAnswer,
    );
  }

  ChoiceWithAnswer toDomainAnswer(String path, {List<Resource>? listRessources}) {
    return ChoiceWithAnswer(
      id: UniqueId.fromUniqueString(id!),
      nom: Nom(nom),
      path: path,
      answer: Anwser(answer ?? ' - '),
      listRessources: listRessources ?? [],
    );
  }

  factory ChoiceDTO.fromJson(Map<String, dynamic> json) => _$ChoiceDTOFromJson(json);

  factory ChoiceDTO.fromFirestore(DocumentSnapshot doc) {
    return ChoiceDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
