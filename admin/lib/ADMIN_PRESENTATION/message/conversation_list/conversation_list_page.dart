import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';

import 'widget/panel_conversation_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ConversationListPage extends ConsumerWidget {
  const ConversationListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: AppAsync(
            ref.watch(allDiscutionProvider),
            builder: (data) => data!.fold(
                (error) => AppError(message: error.toString()),
                (listMessage) => ListView(children: [
                      ...listMessage
                          .map<Widget>((Conversation conversation) =>
                              PanelConversationView(conversation: conversation))
                          .toList()
                    ])),
          ),
        ));
  }
}
