import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/news/news_view/widget/image_news.dart';
import '../../../core/_core/router.dart';

class PanelNewsView extends StatelessWidget {
  final News news;
  const PanelNewsView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'PanelNewsView',
      child: Card(
        color: colorpanel(900),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600)
              return _LargeCard(news: news);
            else
              return _CompressedCard(news: news);
          }),
        ),
      ),
    );
  }
}

class _CompressedCard extends StatelessWidget {
  const _CompressedCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TITRE
        Text("${news.title.getOrCrash()}", style: Theme.of(context).textTheme.titleLarge),
        SpaceH10(),

        //IMAGE
        ImageNews(news),

        SpaceH20(),

        //CONTENU
        AutoSizeText("${news.content}",
            overflow: TextOverflow.ellipsis, maxLines: 4, style: Theme.of(context).textTheme.bodyMedium),
        SpaceH10(),

        //BOUTON VOIR
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.router.push(NewsViewRoute(id: news.id));
            },
            child: Text("Voir"),
            style: Theme.of(context).extension<AppThemeExtention>()?.buttonLight,
          ),
        ),
      ],
    );
  }
}

class _LargeCard extends StatelessWidget {
  const _LargeCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(constraints: BoxConstraints(maxWidth: 350), child: ImageNews(news)),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITRE
              Text("${news.title.getOrCrash()}", style: Theme.of(context).textTheme.titleLarge),
              SpaceH10(),

              //CONTENU
              AutoSizeText("${news.content}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyMedium),
              SpaceH10(),

              //BOUTON VOIR
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(NewsViewRoute(id: news.id));
                  },
                  child: Text("Voir"),
                  style: Theme.of(context).extension<AppThemeExtention>()?.buttonLight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 14),
      ],
    );
  }
}
