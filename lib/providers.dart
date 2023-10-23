import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:mobilite_moderne/APPLICATION/account/modify_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/auth_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/account/new_password_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/register_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/reset_password_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:mobilite_moderne/APPLICATION/message/add_message_form_notifier.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_auth.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/DOMAIN/message/message_failure.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/message/message_repository.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/resource/resource_repository.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/news/news_repository.dart';
import 'APPLICATION/auth/subscription_notifier.dart';
import 'DOMAIN/assistant/choice.dart';
import 'DOMAIN/assistant/assistant_diagnostic_failure.dart';
import 'DOMAIN/auth/subscriptions.dart';
import 'DOMAIN/core/errors.dart';
import 'DOMAIN/core/value_objects.dart';
import 'DOMAIN/news/news.dart';
import 'DOMAIN/resources/app_category.dart';
import 'DOMAIN/resources/app_category_failure.dart';
import 'INFRASTRUCTURE/assistant/assistant_diagnostic_repository.dart';
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
  final userOption = getIt<AuthRepository>().getSignedUser();
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

final allNewsProvider = StreamProvider.autoDispose<Either<NewsFailure, List<News>>>(
    (ref) => ref.watch(newsRepositoryProvider).watch());

final oneNewsProvider = FutureProvider.autoDispose.family<Either<NewsFailure, News>, UniqueId>(
    (ref, id) => ref.watch(newsRepositoryProvider).watchWithId(id));

//Resource

final resourceRepositoryProvider = Provider<IResourceRepository>((ref) => getIt<IResourceRepository>());

//Category
final categoryListProvider = FutureProvider.autoDispose
    .family<Either<AppCategoryFailure, List<AppCategory>>, ResourceMainCategory>(
        (ref, mode) => ref.watch(resourceRepositoryProvider).watchCategoryList(mode));

final categoryViewProvider = FutureProvider.autoDispose
    .family<Either<AppCategoryFailure, List<AppCategory>>, AppCategory>(
        (ref, category) => ref.watch(resourceRepositoryProvider).watchCategoryView(category));

//Assistant Diagnostic
final assistantDiagnosticRepositoryProvider =
    Provider<IAssistantDiagnosticRepository>((ref) => getIt<IAssistantDiagnosticRepository>());

final oneChoiceProvider = FutureProvider.autoDispose
    .family<Either<AssistantDiagnosticFailure, ChoiceWithQuestions>, ChoiceWithQuestions>(
        (ref, choice) => ref.watch(assistantDiagnosticRepositoryProvider).watchWithId(choice));

final oneAnswerProvider = FutureProvider.autoDispose
    .family<Either<AssistantDiagnosticFailure, ChoiceWithAnswer>, ChoiceWithAnswer>(
        (ref, choice) => ref.watch(assistantDiagnosticRepositoryProvider).watchAnswerWithId(choice));

//Message
final messageRepositoryProvider = Provider<IMessageRepository>((ref) => getIt<IMessageRepository>());

final messageFormNotifierProvider =
    StateNotifierProvider.autoDispose<MessageFormNotifier, AddMessageFormData>(
  (ref) => MessageFormNotifier(ref.watch(messageRepositoryProvider)),
);

final allMessageProvider = StreamProvider.autoDispose<Either<MessageFailure, List<Message>>>(
    (ref) => ref.watch(messageRepositoryProvider).watch());

// ABONNEMENT
final subscriptionNotifierProvider =
    StateNotifierProvider.autoDispose<SubscriptionNotifier, SubscriptionState>(
  (ref) => SubscriptionNotifier(ref.watch(authRepositoryProvider)),
);

final userIsSubscribed = FutureProvider.autoDispose<Subscriptions?>((ref) async {
  final userData = await ref.watch(currentUserData.future);
  if (userData != null && userData.idStripe != null) {
    final result = await ref.watch(authRepositoryProvider).isSubscribeTotalAccess(userData.idStripe!);
    return result.fold((l) => null, (sub) => sub);
  } else {
    print('Error: userData $userData is null');
    return null;
  }
});

//insert-provider
//Ne pas supprimer la balise ci-dessus
