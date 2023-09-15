import 'package:another_flushbar/flushbar_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/article/article_failure.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Ressources_viewPage extends StatelessWidget {
  final Category category;
  const Ressources_viewPage(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Ressources de ${category.nom.getOrCrash()}',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: category.listDocument != null
              ? ListView.separated(
                  //children: category.listDocument.map((nameDoc) => ).toList(),
                  itemCount: category.listDocument!.length,
                  itemBuilder: (context, index) {
                    return _DocTile(document: category.listDocument![index]);
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
              : Center(child: Text("Aucun document disponible pour cette catégorie")),
        ),
      ),
    );
  }
}

class _DocTile extends ConsumerWidget {
  const _DocTile({
    super.key,
    required this.document,
  });

  final String document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(document),
      onTap: () async {
        //Open PDF
        final Either<ArticleFailure, String> doc =
            await ref.watch(articleRepositoryProvider).getDocument(document);
        doc.fold((l) => showSnackBar(context, l.toString()),
            (String result) => context.router.push(PdfViewerRoute(url: result, name: document)));
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}