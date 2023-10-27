import 'package:mobilite_moderne/PRESENTATION/core/_components/is_suscribed.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';

import 'widget/panel_news_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NewsListPage extends ConsumerWidget {
  const NewsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssetsImage.actualite),
          fit: BoxFit.cover,
        ),
      ),
      child: ShowComponentFile(
        title: 'NewsListPage',
        child: IsSuscribed(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SpaceH10(),
                  Row(
                    children: [
                      SpaceW10(),
                      InkWell(
                          onTap: () => context.router.pop(),
                          child: Icon(Icons.arrow_back_ios, color: primaryColor, size: 30)),
                      SpaceW10(),
                      Text("ACTUALITÉS",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 26, color: Colors.white)),
                    ],
                  ),
                  const SpaceH10(),
                  Expanded(
                    child: AppAsync(
                      ref.watch(allNewsProvider),
                      builder: (data) => data!.fold(
                          (error) => AppError(message: error.toString()),
                          (listNews) => SingleChildScrollView(
                                child: Align(
                                  child: Wrap(
                                      alignment: WrapAlignment.start,
                                      runAlignment: WrapAlignment.center,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        ...listNews
                                            .map<Widget>((newsObj) => PanelNewsView(news: newsObj))
                                            .toList()
                                      ]),
                                ),
                              )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
