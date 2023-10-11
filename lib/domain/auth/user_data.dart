import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

part 'user_data.freezed.dart';

/// Fiche utilisateur que l'on stocke dans Firestore
@freezed
abstract class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required UniqueId id,
    required Nom userName,
    required EmailAddress? email,
    required bool passwordCrypted,
    required TypeAccount typeAccount,
    String? idStripe,
  }) = _UserData;

  factory UserData.empty() => UserData(
        id: UniqueId(),
        userName: Nom(''),
        email: null,
        passwordCrypted: true,
        typeAccount: TypeAccount(TypeAccountState.email),
        idStripe: null,
      );
}
