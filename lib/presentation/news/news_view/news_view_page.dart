import 'package:mobilite_moderne/PRESENTATION/core/_components/app_bar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';

import '../../core/_components/spacing.dart';
import 'widget/panel_news_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        hasSidebar: false,
        appBar: buildAppBarEmpty(context),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssetsImage.actualite),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SpaceH30(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: InkWell(
                  onTap: () => context.router.pop(),
                  child: Row(
                    children: [
                      SpaceW10(),
                      Icon(Icons.arrow_back_ios, color: primaryColor, size: 30),
                      SpaceW10(),
                      Text("ACTUALITÉS",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 26, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppAsync(ref.watch(oneNewsProvider(id)),
                      builder: (data) => data!.fold((error) => AppError(message: error.toString()),
                          (news) => PanelNewsView(news: news))),
                ),
              ),
            ],
          ),
        ));
  }
}
