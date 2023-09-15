import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/DOMAIN/article/category_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:mobilite_moderne/DOMAIN/article/article_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/PRESENTATION/ressources/category_list/category_list_page.dart';
import 'article_dtos.dart';
import 'category_dtos.dart';

abstract class IArticleRepository {
  Stream<Either<ArticleFailure, List<Article>>> watch();
  Future<Either<ArticleFailure, Article>> watchWithId(UniqueId id);
  Future<Either<ArticleFailure, Unit>> create(Article article);
  Future<Either<ArticleFailure, Unit>> update(Article article);
  Future<Either<ArticleFailure, Unit>> delete(UniqueId id);

  //Category
  Stream<Either<CategoryFailure, List<Category>>> watchCategory(CategoryListPageMode mode);
  Future<Either<CategoryFailure, List<Category>>> watchChildrenCategory(Category id);

  //Ressource
  Future<Either<ArticleFailure, String>> getDocument(String path);
}

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ArticleRepository(
    this._firestore,
    this._storage,
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

  @override
  Stream<Either<CategoryFailure, List<Category>>> watchCategory(CategoryListPageMode mode) async* {
    printDev();
    late CollectionReference<Object?> collection;

    switch (mode) {
      case CategoryListPageMode.mediatheque:
        collection = _firestore.mediathequeCollection;
      case CategoryListPageMode.notice_constructeur:
        collection = _firestore.noticeConstucteurCollection;
      case CategoryListPageMode.pieces_fournisseurs:
        collection = _firestore.pieceFournisseurCollection;
    }

    //Cette fonction retour un stream de categoryCollection avec la liste des categorie dont le nom est dans le champs nom. Pour chaque categorie, on à le stream de la sous catégorie se trouvant la collection subcategory du document

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<CategoryFailure, List<Category>>(
            snapshot.docs.map((doc) {
              try {
                //Subcategory
                final listCategories = collection
                    .doc(doc.id)
                    .collection('sub')
                    .get()
                    .then(
                      (subSnap) => right<CategoryFailure, List<Category>>(
                        subSnap.docs.map((subdoc) {
                          try {
                            //Subcategory
                            return CategoryDTO.fromFirestore(subdoc).toDomain(null, subdoc.reference.path);
                          } catch (e, trace) {
                            print('e $e');
                            print('$trace');
                          }
                          return Category.empty();
                        }).toList(),
                      ),
                    )
                    .catchError((e) {
                  if (e is FirebaseException && e.message!.contains('permission-denied')) {
                    return left(const CategoryFailure.insufficientPermission());
                  } else {
                    return left(const CategoryFailure.unexpected());
                  }
                });

                print('paht : ${doc.reference.path}');

                return CategoryDTO.fromFirestore(doc).toDomain(listCategories, doc.reference.path);
              } catch (e, trace) {
                print('e $e');
                print('$trace');
              }
              return Category.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const CategoryFailure.insufficientPermission());
      } else {
        return left(const CategoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<CategoryFailure, List<Category>>> watchChildrenCategory(Category category) async {
    DocumentReference<Object?> document;
    printDev();
    document = _firestore.doc(category.path);

    return await document.collection('subcategory').get().then((snapshot) => right(
          snapshot.docs
              .map((doc) => CategoryDTO.fromFirestore(doc).toDomain(null, doc.reference.path))
              .toList(),
        ));
  }

  @override
  Future<Either<ArticleFailure, String>> getDocument(String path) async {
    printDev();
    final storageRef = _storage.ref(); //Storage REF
    try {
      return storageRef.child('mediatheque/$path').getDownloadURL().then((value) {
        return right(value);
      });
    } catch (e) {
      return left(ArticleFailure.unexpected());
    }
  }
}
