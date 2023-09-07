import 'package:mobilite_moderne/DOMAIN/auth/failure/new_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_password_form_notifier.freezed.dart';

@freezed
class NewPasswordFormData with _$NewPasswordFormData {
  const factory NewPasswordFormData({
    required Password password,
    required PasswordConfirmation passwordConfirmation,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption,
  }) = _NewPasswordFormData;

  factory NewPasswordFormData.initial() => NewPasswordFormData(
      password: Password(''),
      passwordConfirmation: PasswordConfirmation('', ''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class NewPasswordFormNotifier extends StateNotifier<NewPasswordFormData> {
  final AuthRepository _authRepository;

  NewPasswordFormNotifier(this._authRepository) : super(NewPasswordFormData.initial());

  passwordChanged(String passwordStr) {
    printDev();
    state = state.copyWith(password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  passwordConfirmationChanged(String passwordStr) {
    printDev();
    state = state.copyWith(
        passwordConfirmation: PasswordConfirmation(state.password.value.getOrElse(() => ''), passwordStr),
        authFailureOrSuccessOption: none());
  }

  newPasswordPressed() async {
    printDev();
    Either<NewPasswordFailure, Unit>? failureOrSuccess;

    final isPasswordValid = state.password.isValid();
    final isPasswordConfirmationValid = state.password.isValid();
    if (isPasswordValid && isPasswordConfirmationValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._authRepository.newPassword(newPassword: state.password);

      if (failureOrSuccess.isRight()) {
        //Reinitialise le formulaire
        state = state.copyWith(password: Password(""));
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
