import 'dart:io';

import 'package:admin/ADMIN_DOMAIN/core/upload_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/news/news_dtos.dart';

abstract class IAdminNewsRepository {
  Stream<Either<NewsFailure, List<News>>> watch();
  Future<Either<NewsFailure, News>> watchWithId(UniqueId id);
  Future<Either<NewsFailure, Unit>> create(News news);
  Future<Either<NewsFailure, Unit>> update(News news);
  Future<Either<NewsFailure, Unit>> delete(UniqueId id);
  Future<Either<UploadFailure, Unit>> uploadImage(XFile file);
}

@LazySingleton(as: IAdminNewsRepository)
class AdminNewsRepository implements IAdminNewsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  AdminNewsRepository(
    this._firestore,
    this._storage,
  );

  @override
  Future<Either<NewsFailure, Unit>> create(News news) async {
    try {
      final newsDTO = NewsDTO.fromDomain(news);
      await _firestore.newsCollection.doc(newsDTO.id).set(newsDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NewsFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const NewsFailure.insufficientPermission());
      } else {
        return left(const NewsFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NewsFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.newsCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NewsFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const NewsFailure.unableToUpdate());
      } else {
        return left(const NewsFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NewsFailure, Unit>> update(News news) async {
    try {
      final newsDTO = NewsDTO.fromDomain(news);
      await _firestore.newsCollection.doc(newsDTO.id).update(newsDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NewsFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const NewsFailure.unableToUpdate());
      } else {
        return left(const NewsFailure.unexpected());
      }
    }
  }

  /// Retourne la liste des actualités
  @override
  Stream<Either<NewsFailure, List<News>>> watch() async* {
    final collection = _firestore.newsCollection; //Firestore collection Actualités
    final storageRef = FirebaseStorage.instance.ref(); //Storage REF

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<NewsFailure, List<News>>(
            snapshot.docs.map((doc) {
              try {
                //Chargement de l'actualité + de l'image
                return NewsDTO.fromFirestore(doc).toDomain(imageBytes: _loadImage(storageRef, doc['image']));
              } catch (e) {}
              return News.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const NewsFailure.insufficientPermission());
      } else {
        return left(const NewsFailure.unexpected());
      }
    });
  }

  /// Retourne l'actualité avec l'id
  @override
  Future<Either<NewsFailure, News>> watchWithId(UniqueId id) async {
    final collection = _firestore.newsCollection.doc(id.getOrCrash());
    final storageRef = _storage.ref(); //Storage REF

    return collection.get().then((doc) {
      return right(NewsDTO.fromFirestore(doc).toDomain(imageBytes: _loadImage(storageRef, doc['image'])));
    }) /* .onError((e, stackTrace) => left(const NewsFailure.unexpected())) */;
  }

  _loadImage(Reference storageRef, String path) {
    try {
      //Chargement de l'image

      if (path != "") {
        final imgRef = storageRef.child(path);
        const oneMegabyte = 1024 * 1024;
        return imgRef.getData(oneMegabyte);
      }
    } catch (e) {
      print('Erreur lors du chargement de l\'image');
      print(e);
    }
  }

  @override
  Future<Either<UploadFailure, Unit>> uploadImage(XFile file) async {
    try {
      final TaskSnapshot result =
          await _storage.ref().child('actualites/${file.name}').putFile(File(file.path));
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