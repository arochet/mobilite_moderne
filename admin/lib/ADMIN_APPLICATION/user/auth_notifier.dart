import 'package:admin/ADMIN_INFRASTRUCTURE/user/auth_repository.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
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
      state = userOption.fold(() => const AuthUnauthenticated(), (a) {
        return const AuthAuthenticated();
      });
    } catch (e) {}
  }

  bool authCheckEmail() {
    printDev();
    return _authRepository.isUserEmailVerified();
  }

  Future signOut() async {
    printDev();
    await _authRepository.signOut();
    state = const AuthUnauthenticated();
    print('Sign out !!');
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
    state = const AuthUnauthenticated();
  }

  Future sendEmailVerification() async {
    printDev();
    this._authRepository.sendEmailVerification();
  }
}
