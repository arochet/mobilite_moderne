// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin/ADMIN_INFRASTRUCTURE/core/firebase_injectable_module.dart'
    as _i10;
import 'package:admin/ADMIN_INFRASTRUCTURE/news/admin_news_repository.dart'
    as _i7;
import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart' as _i9;
import 'package:admin/ADMIN_INFRASTRUCTURE/user/users_repository.dart' as _i8;
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i5.FirebaseStorage>(
        () => firebaseInjectableModule.storage);
    gh.lazySingleton<_i6.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i7.IAdminNewsRepository>(() => _i7.AdminNewsRepository(
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i8.UsersRepository>(
      () => _i8.UsersRepositoryFacade(
        gh<_i4.FirebaseFirestore>(),
        gh<_i5.FirebaseStorage>(),
      ),
      registerFor: {
        _dev,
        _test,
        _prod,
      },
    );
    gh.lazySingleton<_i9.AuthRepository>(
      () => _i9.FirebaseAuthFacade(
        gh<_i3.FirebaseAuth>(),
        gh<_i6.GoogleSignIn>(),
        gh<_i4.FirebaseFirestore>(),
        gh<_i5.FirebaseStorage>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$FirebaseInjectableModule extends _i10.FirebaseInjectableModule {}
