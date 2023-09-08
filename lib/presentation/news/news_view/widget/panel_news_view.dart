import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import '../../../core/_core/router.dart';

class PanelNewsView extends StatelessWidget {
  final News news;
  const PanelNewsView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            Text("${news.title.getOrCrash()}", style: Theme.of(context).textTheme.titleLarge),
            SpaceH10(),
            Placeholder(
              fallbackHeight: 200,
              fallbackWidth: double.infinity,
            ),
            //Text("[IMAGE] ${news.image}", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH20(),
            Text("${news.content}", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH10(),
            Divider(
              color: Colors.black,
            ),
            Text("${news.subcontent}",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
            SpaceH10(),
            Wrap(
              spacing: 8.0,
              children: news.keywords
                  .map(
                    (kw) => Chip(label: Text("$kw", style: Theme.of(context).textTheme.labelLarge)),
                  )
                  .toList(),
            ),
            //insert-info
          ],
        ),
      ),
    );
  }
}
