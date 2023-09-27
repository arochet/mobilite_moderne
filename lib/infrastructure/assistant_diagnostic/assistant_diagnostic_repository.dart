import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_repository.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/assistant_diagnostic_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'choice_dtos.dart';

abstract class IAssistantDiagnosticRepository {
  //Future<Either<AssistantDiagnosticFailure, List<ChoiceWithQuestions>>> watch();
  Future<Either<AssistantDiagnosticFailure, ChoiceWithQuestions>> watchWithId(ChoiceWithQuestions choice);
  Future<Either<AssistantDiagnosticFailure, ChoiceWithAnswer>> watchAnswerWithId(ChoiceWithAnswer choice);
  Future<Either<AssistantDiagnosticFailure, Unit>> create(ChoiceWithQuestions choice);
  Future<Either<AssistantDiagnosticFailure, Unit>> update(ChoiceWithQuestions choice);
  Future<Either<AssistantDiagnosticFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IAssistantDiagnosticRepository)
class AssistantDiagnosticRepository implements IAssistantDiagnosticRepository {
  final FirebaseFirestore _firestore;
  final IResourceRepository _articleRepository;

  AssistantDiagnosticRepository(
    this._firestore,
    this._articleRepository,
  );

  @override
  Future<Either<AssistantDiagnosticFailure, Unit>> create(ChoiceWithQuestions choice) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        choice = choice.copyWith(uid: uid);
      else
        return left(const ChoiceFailure.unexpected()); */

      //On crée la méchante tâche
      final choiceDTO = ChoiceDTO.fromQuestionDomain(choice);
      await _firestore.choiceCollection.doc(choiceDTO.id).set(choiceDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const AssistantDiagnosticFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const AssistantDiagnosticFailure.insufficientPermission());
      } else {
        return left(const AssistantDiagnosticFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<AssistantDiagnosticFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.choiceCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const AssistantDiagnosticFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const AssistantDiagnosticFailure.unableToUpdate());
      } else {
        return left(const AssistantDiagnosticFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<AssistantDiagnosticFailure, Unit>> update(ChoiceWithQuestions choice) async {
    try {
      final choiceDTO = ChoiceDTO.fromQuestionDomain(choice);
      await _firestore.choiceCollection.doc(choiceDTO.id).update(choiceDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const AssistantDiagnosticFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const AssistantDiagnosticFailure.unableToUpdate());
      } else {
        return left(const AssistantDiagnosticFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<AssistantDiagnosticFailure, ChoiceWithQuestions>> watchWithId(
      ChoiceWithQuestions choice) async {
    printDev();
    final document = _firestore.doc(choice.path);

    try {
      return document.get().then((doc) async {
        //Get the list of choices
        final listChoixDTO =
            await doc.reference.collection('answer').get().then((value) => value.docs.map((e) {
                  return ChoiceDTO.fromFirestore(e);
                }).toList());

        final qsdf = ChoiceDTO.fromFirestore(doc).toDomain(listChoixDTO, doc.reference.path);

        return right(qsdf);
      });
    } catch (e) {
      print('erreur $e');
      return left(const AssistantDiagnosticFailure.unexpected());
    }
  }

  @override
  Future<Either<AssistantDiagnosticFailure, ChoiceWithAnswer>> watchAnswerWithId(
      ChoiceWithAnswer choice) async {
    printDev();
    final document = _firestore.doc(choice.path);

    try {
      return document.get().then((doc) async {
        //Chargement des ressources lié à la réponse
        final dto = ChoiceDTO.fromFirestore(doc);
        final List<Resource> listFutureResource = [];

        dto.listRessources?.forEach((idResource) async {
          final eitherResource =
              await _articleRepository.getResourceWithId(UniqueId.fromUniqueString(idResource));
          eitherResource.fold(
              (l) => Resource.error(l.toString()), (resource) => listFutureResource.add(resource));
        });

        final choiceAnswer = ChoiceDTO.fromFirestore(doc)
            .toDomainAnswer(doc.reference.path, listRessources: (listFutureResource));

        return right(choiceAnswer);
      });
    } catch (e) {
      print('erreur $e');
      return left(const AssistantDiagnosticFailure.unexpected());
    }
  }
}
