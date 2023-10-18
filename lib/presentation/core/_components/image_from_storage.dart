import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

class ImageFromStorage extends StatelessWidget {
  final Future<String?>? url;
  final Future<Uint8List?>? bytes;
  const ImageFromStorage({
    super.key,
    this.url,
    this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    late Widget widget;

    //IMAGE WEB
    if (kIsWeb)
      widget = FutureBuilder(
          future: url,
          builder: (context, AsyncSnapshot<String?> snapshotUrl) {
            if (snapshotUrl.connectionState == ConnectionState.waiting)
              return Container(
                height: 200,
                color: colorpanel(800),
              );
            else if (snapshotUrl.hasError)
              return Container(
                height: 200,
                child: Center(
                  child: Text("Erreur"),
                ),
              );
            else {
              if (snapshotUrl.data != null)
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0), child: Image.network(snapshotUrl.data!)),
                );
              else {
                return Container(
                  height: 200,
                  color: colorpanel(900),
                );
              }
            }
          });

    //IMAGE MOBILE
    else
      widget = FutureBuilder(
          future: bytes,
          builder: (context, AsyncSnapshot<Uint8List?> snapshotUrl) {
            if (snapshotUrl.connectionState == ConnectionState.waiting)
              return Container(
                height: 200,
                color: colorpanel(800),
              );
            else if (snapshotUrl.hasError)
              return Container(
                height: 200,
                child: Center(
                  child: Text("Erreur"),
                ),
              );
            else {
              if (snapshotUrl.data != null)
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0), child: Image.memory(snapshotUrl.data!)),
                );
              else {
                return Container(
                  height: 200,
                  color: colorpanel(900),
                );
              }
            }
          });

    return Container(height: 200, child: widget);
  }
}
