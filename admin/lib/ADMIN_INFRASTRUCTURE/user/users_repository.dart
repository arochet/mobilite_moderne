import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/user_data_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/src/injectable_annotations.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Stream<Option<List<UserData>>> listUsers();
}

@LazySingleton(as: UsersRepository, env: [Environment.dev, Environment.test, Environment.prod])
class UsersRepositoryFacade extends UsersRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UsersRepositoryFacade(
    this._firestore,
    this._storage,
  );

  /// Pour l'interface administrateur, on peut récupérer tous les utilisateurs
  @override
  Stream<Option<List<UserData>>> listUsers() async* {
    yield* _firestore
        .collection('user')
        .snapshots()
        .map((snapshots) => some(snapshots.docs.map<UserData>((element) {
              return (UserDataDTO.fromFirestore(element).toDomain(null));
            }).toList()));
  }
}
