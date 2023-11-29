import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_file/internet_file.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/providers.dart';
//import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class ResourcePdfViewerWebPage extends ConsumerWidget {
  final Resource resource;
  ResourcePdfViewerWebPage(this.resource, {Key? key})
      : assert(resource.type == ResourceType.document),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

    return MainScaffold(
        title: resource.nom.getOrCrash(),
        child: ShowComponentFile(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AppFutureBuilder(
              future: ref.watch(resourceRepositoryProvider).getDocumentData(resource.documentPath),
              builder: (eitherUrl) =>
                  eitherUrl?.fold(
                    (l) => showSnackBar(context, l.toString()),
                    (data) {
                      //return PDF_View();
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: data != null
                            ? SfPdfViewer.memory(data, key: _pdfViewerKey, onDocumentLoadFailed: (c) {
                                print('--- c.error ---');
                                print(c.error);
                                print(c.description);
                                print('--- c.error ---');
                              })
                            : Center(child: Text("Aucun document disponible pour cette catégorie")),
                      );
                    },
                  ) ??
                  Center(child: Text("Aucun document disponible pour cette catégorie")),
            ),
          ),
        ));
  }
}
