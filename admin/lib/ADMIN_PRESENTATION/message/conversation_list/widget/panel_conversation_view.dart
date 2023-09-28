import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:mobilite_moderne/DOMAIN/message/conversation.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/date_utils.dart';

class PanelConversationView extends StatelessWidget {
  final Conversation conversation;
  const PanelConversationView({Key? key, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(conversation.name.getOrCrash(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: !(conversation.isRead == true) ? FontWeight.bold : FontWeight.normal)),
      subtitle: Text(AppDateUtils.formatDate(conversation.dateLastMessage, "dd/MM HH:mm"),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: !(conversation.isRead == true) ? FontWeight.bold : FontWeight.normal)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () => context.router.push(MessageChatRoute(idUser: conversation.id)),
    );
  }
}
