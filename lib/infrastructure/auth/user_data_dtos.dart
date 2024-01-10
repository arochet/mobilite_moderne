import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_dtos.freezed.dart';
part 'user_data_dtos.g.dart';

/// <b>Fiche utilisateur</b><br>
/// DTO = Data Transfer Object<br>
/// On utilise les DTO pour communiquer avec Firestore<br>
/// On convertis ensuite UserDataDTO en UserData<br>
@freezed
abstract class UserDataDTO implements _$UserDataDTO {
  const UserDataDTO._();

  const factory UserDataDTO({
    @JsonKey(ignore: true) String? id,
    required String userName,
    required String? email,
    required String? userNameLowerCase,
    required bool passwordCrypted,
    required String typeAccount,
    String? idStripe,
    bool? isBlockedIOS,
  }) = _UserDataDTO;

  /// Convertit UserData en UserDataDTO<br>
  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      userName: user.userName.getOrCrash(),
      email: user.email?.getOrCrash(),
      userNameLowerCase: user.userName.getOrCrash().toLowerCase(),
      passwordCrypted: user.passwordCrypted,
      typeAccount: user.typeAccount.getOrCrash().toShortString(),
      idStripe: user.idStripe,
      isBlockedIOS: user.isBlockedIOS,
    );
  }

  /// Convertit UserDataDTO en UserData<br>
  UserData toDomain(String? _email) {
    return UserData(
      id: UniqueId.fromUniqueString(id!),
      userName: Nom(userName),
      email: _email != null ? EmailAddress(_email) : null,
      passwordCrypted: passwordCrypted,
      typeAccount: TypeAccount.fromString(typeAccount),
      idStripe: idStripe,
      isBlockedIOS: isBlockedIOS,
    );
  }

  /// Convertit un Json en UserDataDTO<br>
  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);

  /// Convertit un DocumentSnapshot de FireStore en UserDataDTO<br>
  factory UserDataDTO.fromFirestore(DocumentSnapshot doc) {
    return UserDataDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
