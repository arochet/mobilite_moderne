import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';

import 'widget/add_message.dart';
import 'widget/panel_message_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MessageChatPage extends ConsumerWidget {
  final UniqueId idUser;
  const MessageChatPage(
    this.idUser, {
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
                  Expanded(
                    child: AppAsync(
                      ref.watch(oneDiscutionProvider(idUser)),
                      builder: (data) => data!.fold(
                          (error) => AppError(message: error.toString()),
                          (listMessage) => ListView(children: [
                                ...listMessage
                                    .map<Widget>((messageObj) => PanelMessageView(message: messageObj))
                                    .toList()
                              ])),
                    ),
                  ),
                  MessageFormProvider(idUser: idUser),
                ],
              ),
            )));
  }
}
