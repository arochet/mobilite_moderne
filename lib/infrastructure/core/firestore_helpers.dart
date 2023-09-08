import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilite_moderne/DOMAIN/core/errors.dart';

import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  /// Renvoie la fiche Firestore de l'utilisateur courant
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<AuthRepository>().getSignedUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError);
    return FirebaseFirestore.instance.collection('user').doc(user.id.getOrCrash());
  }

  CollectionReference get passwordClearCollection => collection('passwordClear');

  Future<DocumentReference> aUserDocument(UniqueId idPlayer) async {
    return FirebaseFirestore.instance.collection('user').doc(idPlayer.getOrCrash());
  }

  CollectionReference get newsCollection => collection('news');
//insert-collection
}
