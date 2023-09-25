import 'package:admin/ADMIN_APPLICATION/user/auth_notifier.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/news/admin_news_repository.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart';
import 'package:admin/injection.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/injection.dart';
import 'ADMIN_INFRASTRUCTURE/user/users_repository.dart';

//HOME PAGE
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => const Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

//USERS
final userRepositoryProvider = Provider<UsersRepository>((ref) => getItAdmin<UsersRepository>());

final listUsersFormNotifierProvider = StreamProvider.autoDispose<Option<List<UserData>>>(
    (ref) => ref.watch(userRepositoryProvider).listUsers());

//NEWS
final newsRepositoryProvider = Provider<IAdminNewsRepository>((ref) => getItAdmin<IAdminNewsRepository>());

final allNewsProvider = StreamProvider.autoDispose<Either<NewsFailure, List<News>>>(
    (ref) => ref.watch(newsRepositoryProvider).watch());

//AUTHENTIFICATION
/// Repository pour l'authentification
/// (Gère les appels à Firebase pour ajout / modification / Suppression de comptes)
final authRepositoryProvider = Provider<AuthRepository>((ref) => getIt<AuthRepository>());

/// Vérfie si l'utilisateur est connecté
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);
