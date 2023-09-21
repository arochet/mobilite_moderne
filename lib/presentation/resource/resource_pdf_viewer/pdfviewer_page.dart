import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/providers.dart';

@RoutePage()
class ResourcePdfViewerPage extends ConsumerWidget {
  final Resource resource;
  ResourcePdfViewerPage(this.resource, {Key? key})
      : assert(resource.type == ResourceType.document),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        title: resource.nom.getOrCrash(),
        child: ShowComponentFile(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AppFutureBuilder(
              future: ref.watch(resourceRepositoryProvider).getDocumentURL(resource.documentPath),
              builder: (eitherUrl) =>
                  eitherUrl?.fold(
                    (l) => showSnackBar(context, l.toString()),
                    (url) => PDF().cachedFromUrl(
                      url,
                      placeholder: (progress) => Center(child: Text('$progress %')),
                      errorWidget: (error) => Center(child: Text(error.toString())),
                    ),
                  ) ??
                  Center(child: Text("Aucun document disponible pour cette catégorie")),
            ),
          ),
        ));
  }
}
