import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/DOMAIN/article/category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/article/resource_dtos.dart';
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
  Future<Either<CategoryFailure, List<Category>>> watchCategoryList(CategoryListPageMode mode);
  Future<Either<CategoryFailure, List<Category>>> watchCategoryView(Category id);

  //Ressource
  Future<Either<ArticleFailure, String>> getDocumentURL(String path);
  Future<Either<ResourceFailure, Resource>> watchResourceWithId(UniqueId id);
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

  /// Fonction pour la page principale des catégories : On voit les catégories principales + les sous catégories
  @override
  Future<Either<CategoryFailure, List<Category>>> watchCategoryList(CategoryListPageMode mode) async {
    printDev();
    final CollectionReference<Object?> collection = mode.getCollection(_firestore);
    final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;

    //Récupère les catégories enfants
    try {
      return collection.get().then((snapshot) async {
        final listFutureCategory = (snapshot.docs.map((doc) async {
          return _getCategory(collectionResources, doc);
        }).toList());

        return right<CategoryFailure, List<Category>>(await Future.wait(listFutureCategory));
      });
    } catch (e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const CategoryFailure.insufficientPermission());
      } else {
        return left(const CategoryFailure.unexpected());
      }
    }
    ;
  }

  /// Fonction pour la page des catégories : On voit les catégories enfants ou bien les ressources
  @override
  Future<Either<CategoryFailure, List<Category>>> watchCategoryView(Category category) async {
    DocumentReference<Object?> document;
    printDev();
    document = _firestore.doc(category.path);
    final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;

    return await document.collection('sub').get().then((QuerySnapshot<Map<String, dynamic>> snapshot) async {
      final listFutureCategory = snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
        return _getCategory(collectionResources, doc);
      }).toList();

      return right<CategoryFailure, List<Category>>(await Future.wait(listFutureCategory));
    });
  }

  Future<Category> _getCategory(
      CollectionReference<Object?> collectionResources, QueryDocumentSnapshot<Object?> doc) async {
    //SUBCATEGORY
    final Either<CategoryFailure, List<Category>> listCategories = await doc.reference
        .collection('sub')
        .get()
        .then(
          (subSnap) => right<CategoryFailure, List<Category>>(
            subSnap.docs.map((subdoc) {
              try {
                //Subcategory
                return CategoryDTO.fromFirestore(subdoc)
                    .toDomain(null, subdoc.reference.path, _getResource(subdoc));
              } catch (e) {
                print('e $e');
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

    //RESOURCES
    List<Resource>? listResources = _getResource(doc);

    return CategoryDTO.fromFirestore(doc).toDomain(listCategories, doc.reference.path, listResources);
  }

  List<Resource>? _getResource(QueryDocumentSnapshot<Object?> doc) {
    try {
      final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;
      List<Resource> listResources = [];
      if ((doc.data() as Map).containsKey('listResource') == true) {
        final List? docListResource = doc.get('listResource');
        if (docListResource != null && docListResource.length > 0)
          docListResource.forEach((element) async {
            if (element != null && element != '') {
              final resource = await collectionResources.doc(element).get();
              listResources.add(ResourceDTO.fromFirestore(resource).toDomain());
            }
          });
      }
      return listResources;
    } catch (e) {
      print('petite erreur $e');
      return null;
    }
  }

  @override
  Future<Either<ArticleFailure, String>> getDocumentURL(String path) async {
    printDev();
    final storageRef = _storage.ref(); //Storage REF
    try {
      return storageRef.child(path).getDownloadURL().then((value) {
        return right(value);
      });
    } catch (e) {
      return left(ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ResourceFailure, Resource>> watchResourceWithId(UniqueId id) async {
    final document = _firestore.resourcesCollection.doc(id.getOrCrash());

    return document.get().then((doc) => right(ResourceDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const ResourcesFailure.unexpected())) */;
  }
}
