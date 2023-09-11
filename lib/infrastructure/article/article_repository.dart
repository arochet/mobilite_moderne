import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:mobilite_moderne/DOMAIN/article/article_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'article_dtos.dart';

abstract class IArticleRepository {
  Stream<Either<ArticleFailure, List<Article>>> watch();
  Future<Either<ArticleFailure, Article>> watchWithId(UniqueId id);
  Future<Either<ArticleFailure, Unit>> create(Article article);
  Future<Either<ArticleFailure, Unit>> update(Article article);
  Future<Either<ArticleFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final FirebaseFirestore _firestore;

  ArticleRepository(
    this._firestore,
  );

  @override
  Future<Either<ArticleFailure, Unit>> create(Article article) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        article = article.copyWith(uid: uid);
      else
        return left(const ArticleFailure.unexpected()); */

      //On crée la méchante tâche
      final articleDTO = ArticleDTO.fromDomain(article);
      await _firestore.articleCollection.doc(articleDTO.id).set(articleDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ArticleFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const ArticleFailure.insufficientPermission());
      } else {
        return left(const ArticleFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.articleCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ArticleFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ArticleFailure.unableToUpdate());
      } else {
        return left(const ArticleFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> update(Article article) async {
    try {
      final articleDTO = ArticleDTO.fromDomain(article);
      await _firestore.articleCollection.doc(articleDTO.id).update(articleDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ArticleFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ArticleFailure.unableToUpdate());
      } else {
        return left(const ArticleFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<ArticleFailure, List<Article>>> watch() async* {
    final collection = _firestore.articleCollection;

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<ArticleFailure, List<Article>>(
            snapshot.docs.map((doc) {
              try {
                return ArticleDTO.fromFirestore(doc).toDomain();
              } catch (e) {}
              return Article.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const ArticleFailure.insufficientPermission());
      } else {
        return left(const ArticleFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<ArticleFailure, Article>> watchWithId(UniqueId id) async {
    final collection = _firestore.articleCollection.doc(id.getOrCrash());

    return collection.get().then((doc) => right(ArticleDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const ArticleFailure.unexpected())) */;
  }
}
