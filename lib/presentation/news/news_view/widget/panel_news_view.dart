import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
                        SpaceH5(),
                        Align(alignment: Alignment.centerLeft, child: ListKeywordsChips(news: news)),
                        SpaceH10(),

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
                      LayoutBuilder(builder: (context, BoxConstraints constraints) {
                        if (constraints.maxWidth < 500)
                          return Column(
                            children: [
                              //IMAGE
                              ImageFromStorage(url: news.imageUrl, bytes: news.imageBytes),
                              SpaceH20(),

                              //CONTENU
                              HtmlWidget(news.content),
                              SpaceH10(),
                            ],
                          );
                        else
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //IMAGE
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: ImageFromStorage(
                                  url: news.imageUrl,
                                  bytes: news.imageBytes,
                                ),
                              ),
                              SpaceW10(),

                              //CONTENU
                              Expanded(
                                child: HtmlWidget(news.content),
                              ),
                              SpaceW10(),
                            ],
                          );
                      }),

                      //DIVIDER
                      SpaceH10(),
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
