import 'package:flutter/scheduler.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/date_utils.dart';

import 'widget/add_message.dart';
import 'widget/panel_message_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MessageListPage extends ConsumerWidget {
  const MessageListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        title: "Assistant Diagnostic",
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(child: _ListMessages()),
                  MessageFormProvider(),
                ],
              ),
            )));
  }
}

class _ListMessages extends ConsumerStatefulWidget {
  const _ListMessages({Key? key}) : super(key: key);

  @override
  __ListMessagesState createState() => __ListMessagesState();
}

class __ListMessagesState extends ConsumerState<_ListMessages> {
  late ScrollController _controllerListMessage;

  @override
  void initState() {
    super.initState();
    _controllerListMessage = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500));
      if (_controllerListMessage.hasClients)
        _controllerListMessage.jumpTo(_controllerListMessage.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: AppAsync(ref.watch(currentUser), builder: (currentUserAuth) {
        return AppAsync(
          ref.watch(allMessageProvider),
          builder: (data) => data!.fold((error) => AppError(message: error.toString()), (listMessage) {
            //Scroll to bottom
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              _controllerListMessage.animateTo(_controllerListMessage.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 1), curve: Curves.fastOutSlowIn);
            });

            return ListView(controller: _controllerListMessage, children: [
              //Premier message
              PanelMessageView(
                  message: Message(
                      id: UniqueId(),
                      text: 'Bonjour !\nDécrivez nous la nature de votre problème et ajoutez des photos.',
                      date: DateTime.now(),
                      imageSend: null,
                      videoPath: null,
                      imageRead: null,
                      imagePath: null,
                      idUser: UniqueId(),
                      videoSend: null),
                  idUser: currentUserAuth.id),
              Center(
                  child: Text("Un technicien va vous répondre",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: const Color.fromARGB(255, 81, 81, 81)))),

              //Liste des messages
              ...listMessage
                  .map<Widget>((Message messageObj) =>
                      PanelMessageView(message: messageObj, idUser: currentUserAuth.id))
                  .toList(),

              //Heure du dernier message
              if (listMessage.length > 0)
                Center(
                    child: Text(
                  AppDateUtils.formatDate(listMessage[listMessage.length - 1].date, "HH:mm"),
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              SpaceH20(),
            ]);
          }),
        );
      }),
    );
  }
}
