import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_components/image_from_storage.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

class PanelNewsView extends StatelessWidget {
  final News news;
  const PanelNewsView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: ListView(
          children: [
            //TITRE
            SpaceH10(),
            Text("${news.title.getOrCrash()}", style: Theme.of(context).textTheme.titleLarge),
            SpaceH30(),

            //IMAGE
            ImageFromStorage(
              url: news.imageUrl,
              bytes: news.imageBytes,
            ),
            SpaceH20(),

            //CONTENU
            Text("${news.content.replaceAll('\\n', '\n')}", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH10(),

            //DIVIDER
            Divider(color: Colors.black),
            SpaceH10(),

            //SOUS CONTENU
            Text(news.subcontent.replaceAll('\\n', '\n'),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
            SpaceH10(),

            //TAGS
            Wrap(
              spacing: 8.0,
              children: news.keywords
                  .map(
                    (kw) => Chip(label: Text("$kw", style: Theme.of(context).textTheme.labelLarge)),
                  )
                  .toList(),
            ),
            SpaceH10(),
            //insert-info
          ],
        ),
      ),
    );
  }
}
