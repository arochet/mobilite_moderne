import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class PanelConversationView extends StatelessWidget {
  final Conversation conversation;
  const PanelConversationView({Key? key, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(conversation.name.getOrCrash(), style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(conversation.id.getOrCrash(), style: Theme.of(context).textTheme.bodySmall),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () => context.router.push(MessageChatRoute(idUser: conversation.id)),
    );
  }
}
