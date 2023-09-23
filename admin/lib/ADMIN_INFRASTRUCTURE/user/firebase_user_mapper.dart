import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  UserAuth toDomain() {
    return UserAuth(id: UniqueId.fromUniqueString(uid));
  }
}
