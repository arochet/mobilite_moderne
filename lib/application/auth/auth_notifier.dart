import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ajouter freezed !
abstract class AuthState {
  const AuthState();
}

class AuthInital extends AuthState {
  const AuthInital();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthInital());

  authCheckRequested() {
    printDev();
    try {
      final userOption = _authRepository.getSignedUser();
      state = userOption.fold(() => AuthUnauthenticated(), (a) {
        return AuthAuthenticated();
      });
    } catch (e) {
      print('Error Auth Check Requested: $e');
      state = AuthUnauthenticated();
    }
  }

  bool authCheckEmail() {
    printDev();
    return _authRepository.isUserEmailVerified();
  }

  Future signOut() async {
    printDev();
    await _authRepository.signOut();
    state = AuthUnauthenticated();
  }

  Future deleteAccount(TypeAccountState type) async {
    printDev();
    switch (type) {
      case TypeAccountState.email:
        await _authRepository.deleteAccountWithEmailAndPassword();
        break;
      case TypeAccountState.google:
        await _authRepository.deleteAccountGoogle();
        break;
      default:
        break;
    }
    state = AuthUnauthenticated();
  }

  Future sendEmailVerification() async {
    printDev();
    this._authRepository.sendEmailVerification();
  }
}
