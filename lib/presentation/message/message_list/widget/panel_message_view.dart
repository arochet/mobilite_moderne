import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import '../../../core/_core/router.dart';

class PanelMessageView extends StatelessWidget {
  final UniqueId idUser;
  final Message message;
  const PanelMessageView({Key? key, required this.message, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.idUser == idUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        child: Card(
          margin: EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(message.text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
      ),
    );
  }
}
