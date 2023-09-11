import 'widget/panel_article_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/article/add_article_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class ArticleListPage extends ConsumerWidget {
  const ArticleListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppAsync(
              ref.watch(allArticleProvider),
              builder: (data) => data!.fold(
                  (error) => AppError(message: error.toString()),
                  (listArticle) => ListView(children: [
                        ElevatedButton(
                          onPressed: () {
                            context.router.push(ArticleAddRoute());
                          },
                          child: Text("Ajout Button"),
                        ),
                        ...listArticle
                            .map<Widget>((articleObj) => PanelArticleView(article: articleObj))
                            .toList()
                      ])),
            )));
  }
}
