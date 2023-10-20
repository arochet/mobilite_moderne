import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_components/image_from_storage.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/news/components/list_keywords_chips.dart';
import 'package:mobilite_moderne/PRESENTATION/news/news_list/widget/panel_news_view.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/component/panel_list_resources.dart';

class PanelNewsView extends StatelessWidget {
  final News news;
  const PanelNewsView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // MOTS CLES DE LA NEWS
                        Align(alignment: Alignment.centerLeft, child: ListKeywordsChips(news: news)),
                        SpaceH5(),

                        // TITRE DE LA NEWS
                        Row(
                          children: [
                            Expanded(
                              child: Text("${news.title.getOrCrash()}",
                                  style:
                                      Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                        SpaceH5(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //IMAGE
                      ImageFromStorage(
                        url: news.imageUrl,
                        bytes: news.imageBytes,
                      ),
                      SpaceH20(),

                      //CONTENU
                      Text("${news.content.replaceAll('\\n', '\n')}",
                          style: Theme.of(context).textTheme.bodyMedium),
                      SpaceH10(),

                      //DIVIDER
                      Divider(color: Colors.black),
                      SpaceH10(),

                      //SOUS CONTENU
                      Text(news.subcontent.replaceAll('\\n', '\n'),
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                      SpaceH10(),

                      //RESSOURCES
                      PanelListResources(news.listRessources),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
