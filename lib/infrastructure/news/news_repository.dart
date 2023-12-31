import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/load_image.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_repository.dart';
import 'news_dtos.dart';

abstract class INewsRepository {
  Stream<Either<NewsFailure, List<News>>> watch();
  Future<Either<NewsFailure, News>> watchWithId(UniqueId id);
  Future<Either<NewsFailure, Unit>> create(News news);
  Future<Either<NewsFailure, Unit>> update(News news);
  Future<Either<NewsFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: INewsRepository)
class NewsRepository implements INewsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final IResourceRepository _resourceRepository;

  NewsRepository(
    this._firestore,
    this._storage,
    this._resourceRepository,
  );

  @override
  Future<Either<NewsFailure, Unit>> create(News news) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        news = news.copyWith(uid: uid);
      else
        return left(const NewsFailure.unexpected()); */

      //On crée la méchante tâche
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
    final storageRef = _storage.ref(); //Storage REF

    yield* collection
        .orderBy('datePublished', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NewsFailure, List<News>>(
            snapshot.docs.map((doc) {
              try {
                //Chargement de l'actualité + de l'image
                return NewsDTO.fromFirestore(doc).toDomain(
                  imageBytes: kIsWeb ? null : loadImage(storageRef, doc['image']),
                  imageUrl: kIsWeb ? loadImageWeb(storageRef, doc['image']) : null,
                );
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

    return collection.get().then((doc) async {
      final dto = NewsDTO.fromFirestore(doc);

      //Récupère la liste des ressources associé à l'article
      final List<Resource> listFutureResource = [];
      for (var idResource in dto.listRessources ?? []) {
        final eitherResource =
            await _resourceRepository.getResourceWithId(UniqueId.fromUniqueString(idResource));
        eitherResource.fold(
            (l) => Resource.error(l.toString()), (resource) => listFutureResource.add(resource));
      }

      return right(dto.toDomain(
        imageBytes: kIsWeb ? null : loadImage(storageRef, doc['image']),
        imageUrl: kIsWeb ? loadImageWeb(storageRef, doc['image']) : null,
        listRessources: listFutureResource,
      ));
    }) /* .onError((e, stackTrace) => left(const NewsFailure.unexpected())) */;
  }
}
