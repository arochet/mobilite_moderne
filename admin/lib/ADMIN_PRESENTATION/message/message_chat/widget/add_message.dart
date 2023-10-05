import 'dart:io';

import 'package:admin/ADMIN_APPLICATION/message/add_message_form_notifier.dart';
import 'package:admin/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class MessageFormProvider extends ConsumerWidget {
  final UniqueId idUser;
  const MessageFormProvider({
    Key? key,
    required this.idUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddMessageFormData>(messageFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.warning),
                    messageColor: Colors.red,
                    message: failure.map(
                      insufficientPermission: (_) => 'Permission insuffisante',
                      unableToUpdate: (_) => "Unable to update",
                      unexpected: (_) => "Unexpected",
                      noUserConnected: (_) => "No User connected",
                    )).show(context);
              }, (_) {}));
    });
    return MessageForm(idUser);
  }
}

class MessageForm extends ConsumerStatefulWidget {
  final UniqueId idUser;
  const MessageForm(this.idUser, {Key? key}) : super(key: key);

  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends ConsumerState<MessageForm> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messageFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        Row(
          children: [
            SizedBox(width: 5),

            //Bouton Photo
            if (!kIsWeb)
              IconButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

                  if (photo != null) {
                    ref.read(messageFormNotifierProvider.notifier).imageChanged(photo);
                  }
                },
                icon: Icon(Icons.photo_camera),
              ),
            SizedBox(width: 5),

            // Champs image
            if (state.message.imageSend != null)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48),
                    child: Image.file(
                      fit: BoxFit.fitHeight,
                      File(state.message.imageSend!.path),
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),

            // Champs ajout de texte
            if (state.message.imageSend == null)
              Expanded(
                child: TextFormField(
                  autocorrect: false,
                  controller: _textEditingController,
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  onChanged: (value) {
                    ref.read(messageFormNotifierProvider.notifier).textChanged(value);
                  },
                  validator: (_) {
                    return null;
                  },
                ),
              ),
            SizedBox(width: 5),

            //Bouton d'envoie
            IconButton(
              onPressed: () {
                _textEditingController.clear();
                ref.read(messageFormNotifierProvider.notifier).addMessagePressed(widget.idUser);
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (ref.read(messageFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
