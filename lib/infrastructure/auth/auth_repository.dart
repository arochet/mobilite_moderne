import 'dart:io';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mobilite_moderne/DOMAIN/auth/failure/auth_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/delete_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/new_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/reauthenticate_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/reset_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/server_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/user_data_dtos.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/crypt.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:injectable/injectable.dart';
import './firebase_user_mapper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class AuthRepository {
  Future<Option<UserAuth>> getSignedUser();
  Future<Option<UserData>> getUserData();
  bool isUserEmailVerified();
  Option<User> getUser();
  Future<Option<UserData>> getUserDataWithId(UniqueId idPlayer);
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> modifyAccount({required Nom userName});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> sendEmailVerification();
  Future<Either<DeleteFailure, Unit>> deleteAccountWithEmailAndPassword();
  Future<Either<DeleteFailure, Unit>> deleteAccountGoogle();
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password});
  Future<Either<NewPasswordFailure, Unit>> newPassword({required Password newPassword});
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress});
  Future<void> signOut();
  Future<Either<ServerFailure, Unit>> uploadPhotoProfile(File file);
  Future<Image?> getPhotoProfile();
  Future<Image?> getPhotoProfileOfPlayer(UniqueId idPlayer);
}

@LazySingleton(as: AuthRepository, env: [Environment.dev, Environment.prod])
class FirebaseAuthFacade implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
    this._storage,
  );

  /// Enregistrement de l'utilisateur avec email et mot de passe
  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required EmailAddress emailAddress, required Password password}) async {
    printDev();
    final emailAdressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    //Vérifie la connexion internet
    if (!(await checkInternetConnexion())) return left(AuthFailure.noInternet());

    try {
      //Création compte firebase
      final userCreated = await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAdressStr, password: crypt(passwordStr));
      await userCreated.user?.updateDisplayName(userData.userName.getOrCrash());
      try {
        await this.sendEmailVerification();
      } catch (e) {
        print("SendEmailVerification Fail");
        return left(AuthFailure.invalidUser());
      }
      try {
        //Création des datas Firestore
        final userDoc = await _firestore.userDocument();
        final userDataDTO = UserDataDTO.fromDomain(userData);

        await userDoc.set(userDataDTO.toJson());
      } on FirebaseException catch (e) {
        print(e.code);
        print(e.message);
        print(e.stackTrace);
        if (e.message!.contains('permission')) {
          return left(const AuthFailure.insufficientPermission());
        } else {
          return left(const AuthFailure.serverError());
        }
      } catch (e) {
        return left(const AuthFailure.serverError());
      }

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        print(e.message);
        return left(const AuthFailure.serverError());
      }
    }
  }

  /// Connextion de l'utilisateur avec un mail et un mot de passe
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    printDev();
    final emailAdressStr = emailAdress.getOrCrash();
    final passwordStr = password.getOrCrash();

    //Vérifie la connexion internet
    if (!(await checkInternetConnexion())) return left(AuthFailure.noInternet());

    try {
      String psd = await getPasswordConverted(emailAdressStr, passwordStr);
      await _firebaseAuth.signInWithEmailAndPassword(email: emailAdressStr, password: psd);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return (left(const AuthFailure.invalidPassword()));
        case 'user-not-found':
          return (left(const AuthFailure.invalidUser()));
        case 'email-already-in-use':
          return (left(const AuthFailure.emailAlreadyInUse()));
        default:
          print(e.code);
          return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  /// Connexion de l'utilisateur avec Google
  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    printDev();
    //Vérifie la connexion internet
    if (!(await checkInternetConnexion())) return left(AuthFailure.noInternet());

    try {
      final googleUser = await _googleSignIn.signIn().catchError((onError) {
        print("Error $onError");
      });

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentification = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: googleAuthentification.idToken, accessToken: googleAuthentification.accessToken);
      await _firebaseAuth.signInWithCredential(authCredential);

      try {
        //Création des datas Firestore si c'est la première connexion
        final userDoc = await _firestore.userDocument();
        final userData = UserData(
          id: UniqueId.fromUniqueString(googleUser.id),
          userName: Nom(googleUser.displayName ?? "Uname"),
          typeAccount: TypeAccount(TypeAccountState.google),
          email: EmailAddress(googleUser.email),
          passwordCrypted: false,
        );
        final userDataDTO = UserDataDTO.fromDomain(userData);

        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set(userDataDTO.toJson());
        }
      } on FirebaseException catch (e) {
        if (e.message!.contains('permission')) {
          return left(const AuthFailure.insufficientPermission());
        } else {
          return left(const AuthFailure.serverError());
        }
      } catch (e) {
        return left(const AuthFailure.serverError());
      }

      return right(unit);
    } on PlatformException catch (e) {
      print("error fatal => $e");
      return left(const AuthFailure.serverError());
    } catch (e) {
      print("error fatal2");
      return left(const AuthFailure.serverError());
    }
  }

  /* @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    //Vérifie la connexion internet
    if (!(await checkInternetConnexion()))
      return left(AuthFailure.noInternet());
    try {
      final LoginResult loginResult = await this._facebookAuth.login();
      if (loginResult == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      print("Token ${loginResult.accessToken!.token}");
      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await this._firebaseAuth.signInWithCredential(facebookAuthCredential);
      } else {
        print("echec!! ${loginResult.status}");
        return left(AuthFailure.serverError());
      }

      try {
        //Création des datas Firestore si c'est la première connexion
        final user = this.getUser().fold(() => null, (user) => user);
        if (user != null) {
          final userDoc = await _firestore.userDocument();
          final userData = UserData(
            id: UniqueId.fromUniqueString(user.uid),
            userName: Nom(user.displayName ?? "Uname"),
            typeAccount: TypeAccount(TypeAccountState.facebook),
            email: EmailAddress(user.email ?? ""),
            passwordCrypted: false,
          );
          final userDataDTO = UserDataDTO.fromDomain(userData);

          final docSnapshot = await userDoc.get();
          if (!docSnapshot.exists) {
            await userDoc.set(userDataDTO.toJson());
          }
        } else {
          return left(const AuthFailure.serverError());
        }
      } on FirebaseException catch (e) {
        if (e.message!.contains('permission')) {
          return left(const AuthFailure.insufficientPermission());
        } else {
          return left(const AuthFailure.serverError());
        }
      } catch (e) {
        return left(const AuthFailure.serverError());
      }

      return right(unit);
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  } */

  /// Récupère l'utilisateur courant sans ses infos Firestore
  /// UNIQUEMENT FireAuth
  @override
  Future<Option<UserAuth>> getSignedUser() async {
    printDev();
    return optionOf(_firebaseAuth.currentUser?.toDomain());
  }

  /// Test si le mail de l'utilisateur est vérifié dans sa boite mail
  /// Si ce n'est pas le cas, il peut renvoyer un mail Firebase pour vérifier son mail
  @override
  bool isUserEmailVerified() {
    printDev();
    final user = _firebaseAuth.currentUser;
    final providerId = user?.providerData[0].providerId;
    return ((user != null && user.emailVerified) ||
        (providerId == "facebook.com") ||
        (providerId == "google.com"));
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Option<UserData>> getUserData() async {
    printDev();
    final userDoc = await _firestore.userDocument();
    final docSnapshot = await userDoc.get();
    final email = getUser().fold(() => null, (user) => user.email);
    final uid = getUser().fold(() => null, (user) => user.uid);
    final username = getUser().fold(() => null, (user) => user.displayName);
    if (docSnapshot.exists) {
      return some(UserDataDTO.fromFirestore(docSnapshot).toDomain(email));
    } else if (uid != null && email != null && username != null) {
      //Le compte
      return some(UserData(
          email: EmailAddress(email),
          id: UniqueId.fromUniqueString(uid),
          passwordCrypted: false,
          userName: Nom(username),
          typeAccount: TypeAccount(TypeAccountState.fail)));
    }
    return none();
  }

  @override
  Future<Option<UserData>> getUserDataWithId(UniqueId idUser) async {
    printDev();
    //Attention ! Renvoie une fausse adresse email !
    final userDoc = await _firestore.aUserDocument(idUser);
    final docSnapshot = await userDoc.get();
    final email = getUser().fold(() => null, (user) => user.email);
    if (docSnapshot.exists) {
      return some(UserDataDTO.fromFirestore(docSnapshot).toDomain(""));
    }
    return none();
  }

  /// Dans Firebase, on vient modifier le nom de l'utilisateur courant
  @override
  Future<Either<AuthFailure, Unit>> modifyAccount({required Nom userName}) async {
    printDev();
    try {
      //Mis à jour des données de l'utilisateur Firestore
      final userDoc = await _firestore.userDocument();
      await userDoc.update({'userName': userName.getOrCrash()});

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  /// Suppression dans FireAuth et Firestore des données de l'utilisateur courant
  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountWithEmailAndPassword() async {
    printDev();
    return deleteAccount();
  }

  /// Suppression dans FireAuth et Firestore des données de l'utilisateur courant
  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountGoogle() async {
    printDev();
    await signInWithGoogle();
    final del = deleteAccount();
    if (await del == right(unit)) await this._googleSignIn.signOut();
    return del;
  }

  /* @override
  Future<Either<DeleteFailure, Unit>> deleteAccountFacebook() async {
    await signInWithFacebook();
    final del = deleteAccount();
    if (await del == right(unit)) await this._facebookAuth.logOut();
    return del;
  } */

  /// Suppression dans FireAuth et Firestore des données de l'utilisateur courant
  Future<Either<DeleteFailure, Unit>> deleteAccount() async {
    printDev();
    try {
      FirebaseAuth.instance.currentUser!.delete();
      (await _firestore.userDocument()).delete();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(const DeleteFailure.requiresRecentLogin());
      }
      return left(const DeleteFailure.serverError());
    }
  }

  /// Permet de reconnecté l'utilisateur courant
  /// Utile pour supprimer son  propre compte ou bien modifier son mot de passe
  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password}) async {
    printDev();
    final userOption = getUser();

    if (userOption.isNone())
      return left(ReauthenticateFailure.notAuthenticated());
    else
      return userOption.fold(() => left(const ReauthenticateFailure.serverError()), (user) async {
        String psd = await getPasswordConverted(user.email!, password.getOrCrash());
        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: psd);
        print(credential);

        try {
          // Reauthenticate
          await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(credential);
          return right(unit);
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'user-mismatch':
              return (left(const ReauthenticateFailure.userMismatch()));
            case 'user-not-found':
              return (left(const ReauthenticateFailure.userNotFound()));
            case 'invalid-credential':
              return (left(const ReauthenticateFailure.invalidCredential()));
            case 'invalid-email':
              return (left(const ReauthenticateFailure.invalidEmail()));
            case 'wrong-password':
              return (left(const ReauthenticateFailure.wrongPassword()));
            case 'too-many-requests':
              return (left(const ReauthenticateFailure.tooManyRequest()));
            default:
              return (left(const ReauthenticateFailure.serverError()));
          }
        }
      });
  }

  @override
  Future<Either<NewPasswordFailure, Unit>> newPassword({required Password newPassword}) async {
    printDev();
    final userOption = getUser();
    if (userOption.isNone())
      return left(NewPasswordFailure.serverError());
    else {
      return userOption.fold(() => left(NewPasswordFailure.serverError()), (user) async {
        try {
          final userOption = getUser();
          if (userOption.isNone()) return (left(const NewPasswordFailure.serverError()));
          final email = userOption.fold(() => null, (user) => user.email);
          if (email == null) return (left(const NewPasswordFailure.serverError()));
          final userDoc = FirebaseFirestore.instance.passwordClearCollection;
          await userDoc.doc(email).delete();
          user.updatePassword(crypt(newPassword.getOrCrash()));
          return right(unit);
        } on FirebaseAuthException catch (_) {
          return (left(const NewPasswordFailure.serverError()));
        }
      });
    }
  }

  /// Récupère l'utilisateur courant chez FireAuth (et non pas Firestore)
  @override
  Option<User> getUser() {
    printDev();
    return optionOf(_firebaseAuth.currentUser);
  }

  /// Envoie le mail d'authentification lors de la connexion
  @override
  Future<void> sendEmailVerification() async {
    printDev();
    getUser().fold(
      () => throw UnimplementedError(),
      (user) => user.sendEmailVerification(),
    );
  }

  /// Réinitialisation du mot de passe
  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress}) async {
    printDev();
    try {
      final userDoc = FirebaseFirestore.instance.passwordClearCollection;
      await userDoc.doc(emailAddress.getOrCrash()).set(new Map<String, dynamic>());
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddress.getOrCrash());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return left(ResetPasswordFailure.userNotFound());
        default:
          return left(const ResetPasswordFailure.serverError());
      }
    }
  }

  /// Permet de crypter le mot de passe en clair
  Future<String> getPasswordConverted(String emailAdress, String password) async {
    printDev();
    try {
      final userDoc = FirebaseFirestore.instance.passwordClearCollection;
      final doc = await userDoc.doc(emailAdress).get();
      if (doc.exists) {
        return password;
      }
    } catch (e) {
      print("Fatal Error => $e");
    }

    return crypt(password);
  }

  Future<bool> checkInternetConnexion() async {
    printDev();
    if (!kIsWeb) {
      final connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.none || connectivityResult == ConnectivityResult.bluetooth)
        return false;
      else
        return true;
    } else {
      return true;
    }
  }

  @override
  Future<Either<ServerFailure, Unit>> uploadPhotoProfile(File file) async {
    printDev();
    if (!(await checkInternetConnexion())) return left(ServerFailure.noInternet());
    try {
      //Get user id
      final userOption = getUser();
      final id = userOption.fold(() => null, (u) => u.uid);
      if (id == null) return left(ServerFailure.serverError());

      await _storage.ref('user/$id/photo-profile.png').putFile(file);
      return right(unit);
    } on FirebaseException catch (e) {
      print("FatalError => Upload la photo n'a pas fonctionné");
      print(e.code);
      switch (e.code) {
        default:
          return left(ServerFailure.serverError());
      }
    }
  }

  @override
  Future<Image?> getPhotoProfile() async {
    printDev();
    try {
      final userOption = getUser();
      final id = userOption.fold(() => null, (u) => u.uid);
      if (id == null) return null;

      String downloadURL = await _storage.ref('user/$id/photo-profile.png').getDownloadURL();
      if (downloadURL == "") return null;
      return Image.network(downloadURL);
    } on FirebaseException catch (e) {
      print("FatalException $e");
      print(e.code);
      return null;
    }
  }

  @override
  Future<Image?> getPhotoProfileOfPlayer(UniqueId idPlayer) async {
    printDev();
    try {
      final id = idPlayer.getOrCrash();
      String downloadURL = await _storage.ref('user/$id/photo-profile.png').getDownloadURL();
      if (downloadURL == "") return null;
      return Image.network(downloadURL);
    } on FirebaseException catch (e) {
      print("FatalException $e");
      print(e.code);
      return null;
    }
  }
}
