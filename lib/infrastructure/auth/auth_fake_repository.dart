import 'dart:io';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/auth_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/delete_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/new_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/reauthenticate_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/reset_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/server_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/subscription_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:injectable/injectable.dart';
import 'auth_repository.dart';

@LazySingleton(as: AuthRepository, env: [Environment.test])
class FakeAuthFacade implements AuthRepository {
  UserData _userData = UserData(
    id: UniqueId.fromUniqueString("test"),
    userName: Nom("testName"),
    email: EmailAddress("test@yopmail.com"),
    passwordCrypted: true,
    typeAccount: TypeAccount(TypeAccountState.email),
  );

  FakeAuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required EmailAddress emailAddress, required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    return right(unit);
  }

  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    return right(unit);
  }

  @override
  Option<UserAuth> getSignedUser() => some(UserAuth(id: UniqueId.fromUniqueString("test")));

  @override
  bool isUserEmailVerified() {
    return true;
  }

  @override
  Future<void> signOut() => Future.delayed(Duration(seconds: 1));

  @override
  Future<Option<UserData>> getUserData() async {
    return some(_userData);
  }

  @override
  Future<Option<UserData>> getUserDataWithId(UniqueId idPlayer) async {
    if (idPlayer.getOrCrash() == "test")
      return some(_userData);
    else
      return some(UserData(
        id: idPlayer,
        userName: Nom("kaspa"),
        email: EmailAddress("test2@yopmail.com"),
        passwordCrypted: true,
        typeAccount: TypeAccount(TypeAccountState.email),
      ));
  }

  @override
  Future<Either<AuthFailure, Unit>> modifyAccount({
    required Nom userName,
  }) async {
    _userData = _userData.copyWith(
      userName: userName,
    );
    return right(unit);
  }

  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountWithEmailAndPassword() async {
    return right(unit);
  }

  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountGoogle() async {
    return right(unit);
  }

  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountFacebook() async {
    return right(unit);
  }

  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<NewPasswordFailure, Unit>> newPassword({required Password newPassword}) async {
    return right(unit);
  }

  @override
  Option<User> getUser() => none();

  @override
  Future<void> sendEmailVerification() async {
    getUser().fold(
      () => throw UnimplementedError(),
      (user) => user.sendEmailVerification(),
    );
  }

  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress}) async {
    return right(unit);
  }

  Future<String> getPasswordConverted(String emailAdress, String password) async {
    return crypt(password);
  }

  @override
  Future<Either<ServerFailure, Unit>> uploadPhotoProfile(File file) async {
    return right(unit);
  }

  @override
  Future<Image?> getPhotoProfile() async {
    return null;
  }

  @override
  Future<Image?> getPhotoProfileOfPlayer(UniqueId idPlayer) async {
    return null;
  }

  @override
  Future<Either<SubscriptionFailure, bool>> isSubscribeTotalAccess(String isStripe) async {
    return right(false);
  }

  @override
  Future<Either<SubscriptionFailure, Unit>> subscribeTotalAccess(String isStripe) async {
    return right(unit);
  }

  @override
  Future<Either<SubscriptionFailure, Unit>> paySubscription(
      String qsf, Nom name, EmailAddress email, Address address) async {
    return right(unit);
  }

  @override
  Future<Either<SubscriptionFailure, Unit>> unsubscribeTotalAccess(String idSubscription) async {
    return right(unit);
  }
}
