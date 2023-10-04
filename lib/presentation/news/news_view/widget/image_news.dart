import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

class ImageNews extends StatelessWidget {
  final News news;
  const ImageNews(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    late Widget widget;

    //IMAGE WEB
    if (kIsWeb)
      widget = FutureBuilder(
          future: news.imageUrl,
          builder: (context, AsyncSnapshot<String?> snapshotNews) {
            if (snapshotNews.connectionState == ConnectionState.waiting)
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            else if (snapshotNews.hasError)
              return Container(
                height: 200,
                child: Center(
                  child: Text("Erreur"),
                ),
              );
            else {
              if (snapshotNews.data != null)
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0), child: Image.network(snapshotNews.data!)),
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
          future: news.imageBytes,
          builder: (context, AsyncSnapshot<Uint8List?> snapshotNews) {
            if (snapshotNews.connectionState == ConnectionState.waiting)
              return Container(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            else if (snapshotNews.hasError)
              return Container(
                height: 200,
                child: Center(
                  child: Text("Erreur"),
                ),
              );
            else {
              if (snapshotNews.data != null)
                return Container(
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0), child: Image.memory(snapshotNews.data!)),
                );
              else {
                return Container(
                  height: 200,
                  color: colorpanel(900),
                );
              }
            }
          });

    return widget;
  }
}
