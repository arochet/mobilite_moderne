import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/panel_news_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/news/add_news_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class NewsListPage extends ConsumerWidget {
  const NewsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppAsync(
            ref.watch(allNewsProvider),
            builder: (data) => data!.fold(
                (error) => AppError(message: error.toString()),
                (listNews) => ListView(children: [
                      ElevatedButton(
                        onPressed: () {
                          context.router.push(NewsAddRoute());
                        },
                        child: Text("Nouvelle Actualité"),
                      ),
                      ...listNews.map<Widget>((newsObj) => PanelNewsView(news: newsObj)).toList()
                    ])),
          )),
    );
  }
}
