import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_dtos.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/category_list/category_list_page.dart';
import 'app_category_dtos.dart';

abstract class IResourceRepository {
  //Category
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryList(CategoryListPageMode mode);
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryView(AppCategory id);

  //Ressource
  Future<Either<ResourceFailure, String>> getDocumentURL(String path);
  Future<Either<ResourceFailure, Resource>> watchResourceWithId(UniqueId id);
}

@LazySingleton(as: IResourceRepository)
class ResourceRepository implements IResourceRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ResourceRepository(
    this._firestore,
    this._storage,
  );

  /// Fonction pour la page principale des catégories : On voit les catégories principales + les sous catégories
  @override
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryList(CategoryListPageMode mode) async {
    printDev();
    final CollectionReference<Object?> collection = mode.getCollection(_firestore);
    final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;

    //Récupère les catégories enfants
    try {
      return collection.get().then((snapshot) async {
        final listFutureCategory = (snapshot.docs.map((doc) async {
          return _getCategory(collectionResources, doc);
        }).toList());

        return right<AppCategoryFailure, List<AppCategory>>(await Future.wait(listFutureCategory));
      });
    } catch (e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const AppCategoryFailure.insufficientPermission());
      } else {
        return left(const AppCategoryFailure.unexpected());
      }
    }
    ;
  }

  /// Fonction pour la page des catégories : On voit les catégories enfants ou bien les ressources
  @override
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryView(AppCategory category) async {
    DocumentReference<Object?> document;
    printDev();
    document = _firestore.doc(category.path);
    final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;

    return await document.collection('sub').get().then((QuerySnapshot<Map<String, dynamic>> snapshot) async {
      final listFutureCategory = snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
        return _getCategory(collectionResources, doc);
      }).toList();

      return right<AppCategoryFailure, List<AppCategory>>(await Future.wait(listFutureCategory));
    });
  }

  Future<AppCategory> _getCategory(
      CollectionReference<Object?> collectionResources, QueryDocumentSnapshot<Object?> doc) async {
    //SUBCATEGORY
    final Either<AppCategoryFailure, List<AppCategory>> listCategories = await doc.reference
        .collection('sub')
        .get()
        .then(
          (subSnap) => right<AppCategoryFailure, List<AppCategory>>(
            subSnap.docs.map((subdoc) {
              try {
                //Subcategory
                return AppCategoryDTO.fromFirestore(subdoc)
                    .toDomain(null, subdoc.reference.path, _getResource(subdoc));
              } catch (e) {
                print('e $e');
              }
              return AppCategory.empty();
            }).toList(),
          ),
        )
        .catchError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const AppCategoryFailure.insufficientPermission());
      } else {
        return left(const AppCategoryFailure.unexpected());
      }
    });

    //RESOURCES
    List<Resource>? listResources = _getResource(doc);

    return AppCategoryDTO.fromFirestore(doc).toDomain(listCategories, doc.reference.path, listResources);
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
              if (resource.data() != null) {
                listResources.add(ResourceDTO.fromFirestore(resource).toDomain());
              } else {
                print('Resource $element non trouvé');
              }
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
  Future<Either<ResourceFailure, String>> getDocumentURL(String path) async {
    printDev();
    final storageRef = _storage.ref(); //Storage REF
    try {
      return storageRef.child(path).getDownloadURL().then((value) {
        return right(value);
      });
    } catch (e) {
      return left(ResourceFailure.unexpected());
    }
  }

  @override
  Future<Either<ResourceFailure, Resource>> watchResourceWithId(UniqueId id) async {
    final document = _firestore.resourcesCollection.doc(id.getOrCrash());

    return document.get().then((doc) => right(ResourceDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const ResourcesFailure.unexpected())) */;
  }
}
