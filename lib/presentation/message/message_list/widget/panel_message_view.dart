import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/message/message.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/image_from_storage.dart';

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
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8 - (kIsWeb ? 300 : 0)),
        child: Card(
          margin: EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Builder(
              builder: (context) {
                if (message.videoPath != null) {
                  //VIDEO
                  return InkWell(
                    onTap: () => context.router.push(
                      VideoplayerRoute(message.videoPath!, path: message.videoPath!),
                    ),
                    child: Container(
                      width: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: FittedBox(
                            child: Icon(Icons.play_arrow_rounded, color: Colors.black),
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                  );
                } else if ((message.imagePath != null && message.imagePath != '')) {
                  //IMAGE
                  return ImageFromStorage(
                    url: message.imageUrl,
                    bytes: message.imageRead,
                  );
                } else {
                  //TEXTE
                  return Text(message.text ?? '//', style: Theme.of(context).textTheme.bodyLarge);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
