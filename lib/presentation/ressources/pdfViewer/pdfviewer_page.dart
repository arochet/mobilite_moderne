import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

@RoutePage()
class PdfViewerPage extends StatelessWidget {
  final String name;
  final String url;
  const PdfViewerPage(this.name, this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: '$name',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: PDF().cachedFromUrl(
            url,
            placeholder: (progress) => Center(child: Text('$progress %')),
            errorWidget: (error) => Center(child: Text(error.toString())),
          ),
        ),
      ),
    );
  }
}
