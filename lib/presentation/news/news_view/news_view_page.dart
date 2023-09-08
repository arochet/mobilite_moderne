import 'widget/panel_news_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'widget/panel_news_view.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/APPLICATION/news/add_news_form_notifier.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class NewsViewPage extends ConsumerWidget {
  final UniqueId id;
  const NewsViewPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppAsync(ref.watch(oneNewsProvider(id)),
          builder: (data) => data!
              .fold((error) => AppError(message: error.toString()), (news) => PanelNewsView(news: news))),
    ));
  }
}
