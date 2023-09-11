import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import '../../../core/_core/router.dart';

class PanelArticleView extends StatelessWidget {
  final Article article;
  const PanelArticleView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title : ${article.title.getOrCrash()}", style: Theme.of(context).textTheme.labelLarge),
            Text("brand : ${article.brand.getOrCrash()}", style: Theme.of(context).textTheme.labelLarge),
            Text("description : ${article.description}", style: Theme.of(context).textTheme.labelLarge),
            Text("keyword : ${article.keyword}", style: Theme.of(context).textTheme.labelLarge),
            Text("listRessources : ${article.listRessources}", style: Theme.of(context).textTheme.labelLarge),
            Text("category : ${article.category}", style: Theme.of(context).textTheme.labelLarge),
//insert-info
          ],
        ),
      ),
    );
  }
}
