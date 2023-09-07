import 'package:admin/injection.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
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
