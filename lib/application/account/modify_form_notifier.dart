import 'package:mobilite_moderne/DOMAIN/auth/failure/auth_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'modify_form_notifier.freezed.dart';

@freezed
class ModifyFormData with _$ModifyFormData {
  const factory ModifyFormData({
    required Nom userName,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ModifyFormData;

  factory ModifyFormData.initial() => ModifyFormData(
      userName: Nom(''), showErrorMessages: false, isSubmitting: false, authFailureOrSuccessOption: none());
}

class ModifyFormNotifier extends StateNotifier<ModifyFormData> {
  final AuthRepository _authRepository;

  ModifyFormNotifier(this._authRepository) : super(ModifyFormData.initial());

  setValueWithUserData(UserData userData) {
    printDev();
    state = state.copyWith(
      userName: userData.userName,
    );
  }

  userNameChanged(String nomStr) {
    printDev();
    state = state.copyWith(userName: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  modifyPressed() async {
    printDev();
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.userName.isValid();
    if (isUserNameValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());
      failureOrSuccess = await this._authRepository.modifyAccount(userName: state.userName);
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
