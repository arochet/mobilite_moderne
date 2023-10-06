import 'dart:typed_data';

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
            child: message.imageRead == null && message.imagePath == null && message.imageUrl == null
                ? Text(message.text ?? '//', style: Theme.of(context).textTheme.bodyLarge)
                : ImageFromStorage(
                    url: message.imageUrl,
                    bytes: message.imageRead,
                  ),
          ),
        ),
      ),
    );
  }
}

class _MessageImage extends StatelessWidget {
  final Future<Uint8List?>? imageRead;
  const _MessageImage(this.imageRead, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: 300,
      child: FutureBuilder(
        future: imageRead,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null)
              return Icon(Icons.broken_image, color: Colors.red);
            else
              return Image.memory(
                snapshot.data as Uint8List,
                height: 200,
                fit: BoxFit.scaleDown,
              );
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error ${snapshot.error}", style: Theme.of(context).textTheme.bodyMedium));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Icon(Icons.broken_image, color: Colors.blue);
          } else {
            return Text("${snapshot.connectionState} ${snapshot.stackTrace}",
                style: Theme.of(context).textTheme.bodyMedium);
          }
        },
      ),
    );
  }
}
