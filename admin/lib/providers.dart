import 'package:admin/ADMIN_APPLICATION/message/add_message_form_notifier.dart';
import 'package:admin/ADMIN_APPLICATION/news/add_news_form_notifier.dart';
import 'package:admin/ADMIN_APPLICATION/resource/add_resource_form_notifier.dart';
import 'package:admin/ADMIN_APPLICATION/user/auth_notifier.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/message/message_repository.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/news/admin_news_repository.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/resource/resource_repository.dart';
import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart';
import 'package:admin/injection.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/DOMAIN/core/errors.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/DOMAIN/message/message_failure.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/injection.dart';
import 'ADMIN_INFRASTRUCTURE/user/users_repository.dart';

//HOME PAGE
final currentPageNavProvider = StateProvider<int>((ref) => 0);

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => const Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

//USERS
final userRepositoryProvider = Provider<UsersRepository>((ref) => getItAdmin<UsersRepository>());

/// Utilisateur courant (comprend son identifiant FirebaseAuth)
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getItAdmin<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

final listUsersFormNotifierProvider = StreamProvider.autoDispose<Option<List<UserData>>>(
    (ref) => ref.watch(userRepositoryProvider).listUsers());

//NEWS
final newsRepositoryProvider = Provider<IAdminNewsRepository>((ref) => getItAdmin<IAdminNewsRepository>());

final allNewsProvider = StreamProvider.autoDispose<Either<NewsFailure, List<News>>>(
    (ref) => ref.watch(newsRepositoryProvider).watch());

final newsFormNotifierProvider = StateNotifierProvider.autoDispose<NewsFormNotifier, AddNewsFormData>(
  (ref) => NewsFormNotifier(ref.watch(newsRepositoryProvider)),
);

//AUTHENTIFICATION
/// Repository pour l'authentification
/// (Gère les appels à Firebase pour ajout / modification / Suppression de comptes)
final authRepositoryProvider = Provider<AuthRepository>((ref) => getItAdmin<AuthRepository>());

/// Vérfie si l'utilisateur est connecté
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

//RESOURCE
final resourceRepositoryProvider = Provider<IResourceRepository>((ref) => getItAdmin<IResourceRepository>());

//Liste des ressources
final allResourceProvider = StreamProvider.autoDispose<Either<ResourceFailure, List<Resource>>>(
    (ref) => ref.watch(resourceRepositoryProvider).watch());

//Ressource unique
final oneResourceProvider = FutureProvider.autoDispose.family<Either<ResourceFailure, Resource>, UniqueId>(
    (ref, id) => ref.watch(resourceRepositoryProvider).watchWithId(id));

//Formulaire d'ajout de ressource
final resourceFormNotifierProvider =
    StateNotifierProvider.autoDispose<ResourceFormNotifier, AddResourceFormData>(
  (ref) => ResourceFormNotifier(ref.watch(resourceRepositoryProvider)),
);

//Liste des catégories pour le formulaire d'ajout de ressource
final categoryViewProvider = FutureProvider.autoDispose
    .family<Either<AppCategoryFailure, List<AppCategory>>, AppCategory>(
        (ref, category) => ref.watch(resourceRepositoryProvider).watchCategoryView(category));

/// MESSAGE REPOSITORY
final messageRepositoryProvider = Provider<IMessageRepository>((ref) => getItAdmin<IMessageRepository>());

/// Formulaire d'ajout de message
final messageFormNotifierProvider =
    StateNotifierProvider.autoDispose<MessageFormNotifier, AddMessageFormData>(
  (ref) => MessageFormNotifier(ref.watch(messageRepositoryProvider)),
);

/// Liste des discussions
final allDiscutionProvider = StreamProvider.autoDispose<Either<MessageFailure, List<Conversation>>>(
    (ref) => ref.watch(messageRepositoryProvider).watchAllConversation());

/// Une discussion
final oneDiscutionProvider = StreamProvider.autoDispose
    .family<Either<MessageFailure, List<Message>>, UniqueId>(
        (ref, idUser) => ref.watch(messageRepositoryProvider).watchConversation(idUser));

//insert-provider
