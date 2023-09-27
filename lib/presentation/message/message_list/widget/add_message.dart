import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/auth/register_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:mobilite_moderne/APPLICATION/message/add_message_form_notifier.dart';
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
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(messageFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        Row(
          children: [
            SizedBox(width: 5),

            // Champs ajout de texte
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
                ref.read(messageFormNotifierProvider.notifier).addMessagePressed();
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
