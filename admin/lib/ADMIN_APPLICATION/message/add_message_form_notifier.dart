import 'package:admin/ADMIN_INFRASTRUCTURE/message/message_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/DOMAIN/message/message_failure.dart';
part 'add_message_form_notifier.freezed.dart';

@freezed
class AddMessageFormData with _$AddMessageFormData {
  const factory AddMessageFormData({
    required Message message,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<MessageFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddMessageFormData;

  factory AddMessageFormData.initial() => AddMessageFormData(
      message: Message.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class MessageFormNotifier extends StateNotifier<AddMessageFormData> {
  final IMessageRepository _iMessageRepository;

  MessageFormNotifier(this._iMessageRepository) : super(AddMessageFormData.initial());

  textChanged(String param) {
    state = state.copyWith(message: state.message.copyWith(text: param), authFailureOrSuccessOption: none());
  }

  imageChanged(XFile param) {
    //Le chemin de l'image est mis à jour dans le repository
    state = state.copyWith(
      message: state.message.copyWith(imageSend: param),
      authFailureOrSuccessOption: none(),
    );
  }
//insert-changed

  addMessagePressed(UniqueId idUser) async {
    Either<MessageFailure, Unit>? failureOrSuccess;

    //insert-valid-params
    if (true /* insert-valid-condition */) {
      state = state.copyWith(
          message: state.message.copyWith(date: DateTime.now()),
          isSubmitting: true,
          authFailureOrSuccessOption: none());

      failureOrSuccess = await _iMessageRepository.create(idUser, state.message);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(message: Message.empty());
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
