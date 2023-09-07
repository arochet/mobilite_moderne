import 'package:mobilite_moderne/DOMAIN/auth/failure/reset_password_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_password_notifier.freezed.dart';

@freezed
class ResetPasswordFormData with _$ResetPasswordFormData {
  const factory ResetPasswordFormData({
    required EmailAddress emailAddress,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption,
  }) = _ResetPasswordFormData;

  factory ResetPasswordFormData.initial() => ResetPasswordFormData(
      emailAddress: EmailAddress(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ResetPasswordFormNotifier extends StateNotifier<ResetPasswordFormData> {
  final AuthRepository _authRepository;

  ResetPasswordFormNotifier(this._authRepository) : super(ResetPasswordFormData.initial());

  emailChanged(String str) {
    printDev();
    state = state.copyWith(emailAddress: EmailAddress(str), authFailureOrSuccessOption: none());
  }

  resetPasswordPressed() async {
    printDev();
    Either<ResetPasswordFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    if (isEmailValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._authRepository.resetPassword(emailAddress: state.emailAddress);

      if (failureOrSuccess.isRight()) {
        //Reinitialise le formulaire
        state = state.copyWith(emailAddress: EmailAddress(""));
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
