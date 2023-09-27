import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilite_moderne/DOMAIN/core/errors.dart';

import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  /// Renvoie la fiche Firestore de l'utilisateur courant
  Future<DocumentReference> userDocument() async {
    final userOption = await getItAdmin<AuthRepository>().getSignedUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError);
    return FirebaseFirestore.instance.collection('user').doc(user.id.getOrCrash());
  }

  CollectionReference get passwordClearCollection => collection('passwordClear');

  Future<DocumentReference> aUserDocument(UniqueId idPlayer) async {
    return FirebaseFirestore.instance.collection('user').doc(idPlayer.getOrCrash());
  }

  CollectionReference get newsCollection => collection('news');
  CollectionReference get categoryCollection => collection('category');
  CollectionReference get mediathequeCollection =>
      collection('category').doc('mediatheque').collection('sub');
  CollectionReference get noticeConstucteurCollection =>
      collection('category').doc('notice_constructeur').collection('sub');
  CollectionReference get pieceFournisseurCollection =>
      collection('category').doc('pieces_et_fournisseurs').collection('sub');
  CollectionReference get resourcesCollection => collection('resources');
  CollectionReference get choiceCollection => collection('choice');
//insert-collection
}
