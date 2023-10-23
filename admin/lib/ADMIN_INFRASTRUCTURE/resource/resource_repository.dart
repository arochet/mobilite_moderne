import 'dart:io';

import 'package:admin/ADMIN_DOMAIN/core/upload_failure.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_add/widget/resource_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/app_category_dtos.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_dtos.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';

abstract class IResourceRepository {
  /// Récupère toutes les ressources
  Stream<Either<ResourceFailure, List<Resource>>> watch();

  /// Récupère une ressource avec son id
  Future<Either<ResourceFailure, Resource>> watchWithId(UniqueId id);

  /// Créer une ressource
  Future<Either<ResourceFailure, UniqueId>> create(Resource resource);

  /// Met à jour une ressource
  Future<Either<ResourceFailure, Unit>> update(Resource resource);

  /// Supprime une ressource
  Future<Either<ResourceFailure, Unit>> delete(Resource resource);

  /// Upload un fichier File
  Future<Either<UploadFailure, Unit>> uploadFile(File file, String path);

  /// Upload un fichier avec les bytes
  Future<Either<UploadFailure, Unit>> uploadFileBytes(Uint8List bytes, String path);

  /// Upload une image
  Future<Either<UploadFailure, Unit>> uploadImage(XFile file, ResourceMainCategory category);

  /// Récupère les catégories enfants ou les ressources
  Future<Either<AppCategoryFailure, List<AppCategory>>> watchCategoryView(AppCategory category);

  /// Ajoute une ressource à une catégorie
  Future<Either<AppCategoryFailure, Unit>> addResourceToCategory(AppCategory category, UniqueId idResource);
}

@LazySingleton(as: IResourceRepository)
class ResourceRepository implements IResourceRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ResourceRepository(
    this._firestore,
    this._storage,
  );

  @override
  Future<Either<ResourceFailure, UniqueId>> create(Resource resource) async {
    try {
      //On crée la méchante tâche
      final resourceDTO = ResourceDTO.fromDomain(resource);
      await _firestore.resourcesCollection.doc(resourceDTO.id).set(resourceDTO.toJson());

      return right(UniqueId.fromUniqueString(resourceDTO.id!));
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ResourceFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const ResourceFailure.insufficientPermission());
      } else {
        return left(const ResourceFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ResourceFailure, Unit>> delete(Resource resource) async {
    try {
      await _firestore.resourcesCollection.doc(resource.id.getOrCrash()).delete();
      await _storage.ref().child(resource.documentPath).delete();
      await _storage.ref().child(resource.imagePath).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ResourceFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ResourceFailure.unableToUpdate());
      } else {
        return left(const ResourceFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ResourceFailure, Unit>> update(Resource resource) async {
    try {
      final resourceDTO = ResourceDTO.fromDomain(resource);
      await _firestore.resourcesCollection.doc(resourceDTO.id).update(resourceDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ResourceFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ResourceFailure.unableToUpdate());
      } else {
        return left(const ResourceFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<ResourceFailure, List<Resource>>> watch() async* {
    final collection = _firestore.resourcesCollection;

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<ResourceFailure, List<Resource>>(
            snapshot.docs.map((doc) {
              try {
                return ResourceDTO.fromFirestore(doc).toDomain(null);
              } catch (e) {}
              return Resource.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const ResourceFailure.insufficientPermission());
      } else {
        return left(const ResourceFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<ResourceFailure, Resource>> watchWithId(UniqueId id) async {
    final collection = _firestore.resourcesCollection.doc(id.getOrCrash());

    return collection.get().then((doc) => right(ResourceDTO.fromFirestore(doc)
        .toDomain(null))) /* .onError((e, stackTrace) => left(const ResourceFailure.unexpected())) */;
  }

  @override
  Future<Either<UploadFailure, Unit>> uploadFile(File file, String path) async {
    try {
      final TaskSnapshot result = await _storage.ref().child(path).putFile(file);
      return right(unit);
    } on FirebaseException catch (e) {
      print(e.code);
      print(e.message);
      print(e.stackTrace);
      switch (e.code) {
        case 'permission-denied':
          return left(UploadFailure.insufficientPermission());
        case 'download-size-exceeded':
          return left(UploadFailure.downloadExceed());
        default:
          return left(UploadFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<UploadFailure, Unit>> uploadFileBytes(Uint8List bytes, String path) async {
    try {
      final TaskSnapshot result = await _storage.ref().child(path).putData(bytes);
      return right(unit);
    } on FirebaseException catch (e) {
      print(e.code);
      print(e.message);
      print(e.stackTrace);
      switch (e.code) {
        case 'permission-denied':
          return left(UploadFailure.insufficientPermission());
        case 'download-size-exceeded':
          return left(UploadFailure.downloadExceed());
        default:
          return left(UploadFailure.unexpected());
      }
    }
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
        if (docListResource != null && docListResource.length > 0) {
          docListResource.forEach((element) async {
            if (element != null && element != '') {
              final resource = await collectionResources.doc(element).get();
              if (resource.data() != null) {
                listResources.add(ResourceDTO.fromFirestore(resource).toDomain(null));
              } else {
                print('Erreur ! Resource $element non trouvée');
              }
            }
          });
        }
      } else {
        return null;
      }
      return listResources;
    } catch (e) {
      print('petite erreur $e');
      return null;
    }
  }

  /// Fonction pour ajouter une ressource à une catégorie
  Future<Either<AppCategoryFailure, Unit>> addResourceToCategory(
      AppCategory category, UniqueId idResource) async {
    try {
      final json = AppCategoryDTO.fromDomainWithResource(category, idResource).toJson();
      await _firestore.doc(category.path).update(json);

      return right(unit);
    } on FirebaseException catch (e) {
      print('-> $e');
      if (e.message!.contains('permission-denied')) {
        return left(const AppCategoryFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const AppCategoryFailure.unableToUpdate());
      } else {
        return left(const AppCategoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<UploadFailure, Unit>> uploadImage(XFile file, ResourceMainCategory category) async {
    try {
      if (kIsWeb) {
        final data = await file.readAsBytes();
        await _storage
            .ref()
            .child('${category.nameFile}/${file.name}')
            .putData(data, SettableMetadata(contentType: 'image/png'));
      } else {
        await _storage.ref().child('${category.nameFile}/${file.name}').putFile(File(file.path));
      }
      return right(unit);
    } on FirebaseException catch (e) {
      print(e.code);
      print(e.message);
      switch (e.code) {
        case 'permission-denied':
          return left(UploadFailure.insufficientPermission());
        case 'download-size-exceeded':
          return left(UploadFailure.downloadExceed());
        default:
          return left(UploadFailure.unexpected());
      }
    }
  }
}
