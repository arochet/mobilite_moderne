import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
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
import 'package:mobilite_moderne/PRESENTATION/resource/resource_menu/widget/panel_category_list.dart';
import '../core/load_image.dart';
import 'app_category_dtos.dart';

abstract class IResourceRepository {
  //Category
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryList(ResourceMainCategory mode);
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryView(AppCategory id);

  //Ressource
  Future<Either<ResourceFailure, String>> getDocumentURL(String path);
  Future<Either<ResourceFailure, Resource>> getResourceWithId(UniqueId id);

  Reference get storageRef;
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
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryList(ResourceMainCategory mode) async {
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
    final Either<AppCategoryFailure, List<AppCategory>> listCategories =
        await doc.reference.collection('sub').get().then((subSnap) async {
      final List<Future<AppCategory>> listFutureAppCategory = subSnap.docs.map((subdoc) async {
        try {
          //Subcategory
          final subCategory = (await subdoc.reference.collection('sub').get()).size;
          return AppCategoryDTO.fromFirestore(subdoc).toDomain(
            null,
            subdoc.reference.path, // Chemin de la sous catégorie
            await _getResource(subdoc), // Liste des ressources de la sous catégorie
            subCategory > 0, // Si la sous catégorie a des sous catégories
          );
        } catch (e) {
          print('e $e');
        }
        return AppCategory.empty();
      }).toList();

      //Retourne la liste des categories
      return right<AppCategoryFailure, List<AppCategory>>(await Future.wait(listFutureAppCategory));
    }).catchError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const AppCategoryFailure.insufficientPermission());
      } else {
        return left(const AppCategoryFailure.unexpected());
      }
    });

    //RESOURCES
    List<Resource>? listResources = await _getResource(doc);

    final bool hasCategory = listCategories.fold((l) => false, (r) => r.length > 0);
    return AppCategoryDTO.fromFirestore(doc)
        .toDomain(listCategories, doc.reference.path, listResources, hasCategory);
  }

  Future<List<Resource>?> _getResource(QueryDocumentSnapshot<Object?> doc) async {
    final storageRef = _storage.ref(); //Storage REF
    final CollectionReference<Object?> collectionResources = _firestore.resourcesCollection;

    try {
      List<Resource> listResources = [];
      //Doc contient la liste des ressources
      if ((doc.data() as Map).containsKey('listResource') == true) {
        final List? docListResource = doc.get('listResource');
        if (docListResource != null && docListResource.length > 0)
          //Pour chaque ressource
          for (final element in docListResource) {
            if (element != null && element != '') {
              final resource =
                  await collectionResources.doc(element).get(); //On cherche la resource dans la collection
              if (resource.data() != null) {
                final hasImg = (resource.data() as Map).containsKey('image') == true;
                // On charge l'image de la ressource + on ajoute la ressource à la liste
                listResources.add(ResourceDTO.fromFirestore(resource).toDomain(storageRef));
              } else {
                print('Resource $element non trouvé');
              }
            }
          }
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

    //Pour le web !

    try {
      if (kIsWeb) {
        //WEB
        String url =
            await _storage.refFromURL('gs://mobilite-moderne.appspot.com/').child(path).getDownloadURL();
        return right(url);
      } else {
        //MOBILE

        final storageRef = _storage.ref(); //Storage REF
        final value = await storageRef.child(path).getDownloadURL();
        return right(value);
      }
    } on FirebaseException catch (e) {
      print('WEB error ${e.code}');
      switch (e.code) {
        case 'object-not-found':
          return left(ResourceFailure.notExist());
        default:
          return left(ResourceFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ResourceFailure, Resource>> getResourceWithId(UniqueId id) async {
    final document = _firestore.resourcesCollection.doc(id.getOrCrash());
    final storageRef = _storage.ref(); //Storage REF

    return document.get().then((doc) {
      if (doc.data() == null) return left(ResourceFailure.notExist());
      return right(ResourceDTO.fromFirestore(doc).toDomain(storageRef));
    });
  }

  Reference get storageRef => _storage.ref();
}
