import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilite_moderne/APPLICATION/auth/register_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:mobilite_moderne/APPLICATION/message/add_message_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class MessageFormProvider extends ConsumerWidget {
  const MessageFormProvider({
    Key? key,
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
    return MessageForm();
  }
}

class MessageForm extends ConsumerStatefulWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends ConsumerState<MessageForm> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messageFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 5),

            //Bouton Photo
            IconButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? photo =
                    await picker.pickImage(source: kIsWeb ? ImageSource.gallery : ImageSource.camera);
                if (photo != null) {
                  ref.read(messageFormNotifierProvider.notifier).imageChanged(photo);
                }
              },
              icon:
                  Icon(kIsWeb ? /* piecejointe */ Icons.attachment : Icons.photo_camera, color: Colors.black),
            ),
            //Bouton Video
            if (!kIsWeb)
              IconButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? video = await picker.pickVideo(source: ImageSource.camera);
                  if (video != null) {
                    ref.read(messageFormNotifierProvider.notifier).videoChanged(video);
                  }
                },
                icon: Icon(Icons.video_camera_back),
              ),
            SizedBox(width: 5),

            // Champs image
            if (state.message.imageSend != null) ...[
              if (!kIsWeb)
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
              if (kIsWeb)
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48),
                      child: Image.network(
                        fit: BoxFit.fitHeight,
                        state.message.imageSend!.path,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ),
            ],

            // Champs video
            if (state.message.videoSend != null) ...[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48),
                    child: Icon(Icons.play_circle, size: 30),
                  ),
                ),
              ),
            ],

            // Champs ajout de texte
            if (state.message.imageSend == null && state.message.videoSend == null)
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
                FocusScope.of(context).requestFocus(new FocusNode());
                ref.read(messageFormNotifierProvider.notifier).addMessagePressed();
              },
              icon: CircleAvatar(
                child: Icon(Icons.send_outlined, size: 20),
                backgroundColor: primaryColor,
                foregroundColor: Colors.black,
              ),
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
