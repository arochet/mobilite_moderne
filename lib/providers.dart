import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/APPLICATION/account/modify_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/article/add_article_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/auth_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/account/new_password_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/register_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/reset_password_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/news/add_news_form_notifier.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/DOMAIN/article/category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:mobilite_moderne/DOMAIN/article/article_failure.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/article/article_repository.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/news/news_repository.dart';
import 'package:mobilite_moderne/PRESENTATION/ressources/category_list/category_list_page.dart';

import 'DOMAIN/article/category.dart';
import 'DOMAIN/core/errors.dart';
import 'DOMAIN/core/value_objects.dart';
import 'DOMAIN/news/news.dart';
import 'INFRASTRUCTURE/auth/auth_repository.dart';
import 'injection.dart';

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

//AUTHENTIFICATION
/// Repository pour l'authentification
/// (Gère les appels à Firebase pour ajout / modification / Suppression de comptes)
final authRepositoryProvider = Provider<AuthRepository>((ref) => getIt<AuthRepository>());

/// Vérfie si l'utilisateur est connecté
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

/// FORM - Formulaire de connexion
final signInFormNotifierProvider = StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire d'inscription
final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de modification des données utilisateurs
final modifyFormNotifierProvider = StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de réauthentification
/// (Demande le mot de passe pour effectuer une action sensible)
final reauthenticateFormNotifierProvider =
    StateNotifierProvider.autoDispose<ReauthenticateFormNotifier, ReauthenticateFormData>(
  (ref) => ReauthenticateFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de demande de nouveau mot de passe
final newPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<NewPasswordFormNotifier, NewPasswordFormData>(
  (ref) => NewPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire pour réinitialiser le mot de passe
final resetPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordFormNotifier, ResetPasswordFormData>(
  (ref) => ResetPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//HOME PAGE
/// Index de la page courante sur la barre de navigation du menu principal
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//USER
/// Utilisateur courant (comprend son identifiant FirebaseAuth)
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

/// Utilisateur courant (comprend ses données FireStore)
final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  ref.watch(currentUser);
  final userOption = await getIt<AuthRepository>().getUserData();
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

//News

final newsRepositoryProvider = Provider<INewsRepository>((ref) => getIt<INewsRepository>());

final newsFormNotifierProvider = StateNotifierProvider.autoDispose<NewsFormNotifier, AddNewsFormData>(
  (ref) => NewsFormNotifier(ref.watch(newsRepositoryProvider)),
);

final allNewsProvider = StreamProvider.autoDispose<Either<NewsFailure, List<News>>>(
    (ref) => ref.watch(newsRepositoryProvider).watch());

final oneNewsProvider = FutureProvider.autoDispose.family<Either<NewsFailure, News>, UniqueId>(
    (ref, id) => ref.watch(newsRepositoryProvider).watchWithId(id));

//Article

final articleRepositoryProvider = Provider<IArticleRepository>((ref) => getIt<IArticleRepository>());

final articleFormNotifierProvider =
    StateNotifierProvider.autoDispose<ArticleFormNotifier, AddArticleFormData>(
  (ref) => ArticleFormNotifier(ref.watch(articleRepositoryProvider)),
);

final allArticleProvider = StreamProvider.autoDispose<Either<ArticleFailure, List<Article>>>(
    (ref) => ref.watch(articleRepositoryProvider).watch());

final oneArticleProvider = FutureProvider.autoDispose.family<Either<ArticleFailure, Article>, UniqueId>(
    (ref, id) => ref.watch(articleRepositoryProvider).watchWithId(id));

//Category
final categoryListProvider = FutureProvider.autoDispose
    .family<Either<CategoryFailure, List<Category>>, CategoryListPageMode>(
        (ref, mode) => ref.watch(articleRepositoryProvider).watchCategoryList(mode));

final categoryViewProvider = FutureProvider.autoDispose
    .family<Either<CategoryFailure, List<Category>>, Category>(
        (ref, category) => ref.watch(articleRepositoryProvider).watchCategoryView(category));
//insert-provider
//Ne pas supprimer la balise ci-dessus
