import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

class ImageFromStorage extends StatelessWidget {
  final Future<String?>? url;
  final Future<Uint8List?>? bytes;
  final double width;
  final double height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const ImageFromStorage({
    super.key,
    this.url,
    this.bytes,
    this.width = 200,
    this.height = 200,
    this.fit,
    this.borderRadius,
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
              return _Waiting(height: height);
            else if (snapshotUrl.hasError)
              //ERREUR
              return _Erreur(height: height);
            else {
              if (snapshotUrl.data != null)
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                      child: FittedBox(
                        child: Image.network(snapshotUrl.data!),
                        fit: fit ?? BoxFit.fitHeight,
                      )),
                );
              else {
                return _NoData(height: height);
              }
            }
          });

    //IMAGE MOBILE
    else
      widget = FutureBuilder(
          future: bytes,
          builder: (context, AsyncSnapshot<Uint8List?> snapshotUrl) {
            if (snapshotUrl.connectionState == ConnectionState.waiting)
              //ATTENTE
              return _Waiting(height: height);
            else if (snapshotUrl.hasError)
              //ERREUR
              return _Erreur(height: height);
            else {
              if (snapshotUrl.data != null) {
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                      child: FittedBox(
                        child: Image.memory(snapshotUrl.data!),
                        fit: fit ?? BoxFit.fitHeight,
                      )),
                );
              } else {
                return _NoData(height: height);
              }
            }
          });

    return Container(height: height, child: widget);
  }
}

class _NoData extends StatelessWidget {
  const _NoData({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: colorpanel(900),
      child: Center(
          child: Text("Pas d'image",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey))),
    );
  }
}

class _Waiting extends StatelessWidget {
  const _Waiting({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colorpanel(800),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class _Erreur extends StatelessWidget {
  const _Erreur({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: Text("Erreur"),
      ),
    );
  }
}
