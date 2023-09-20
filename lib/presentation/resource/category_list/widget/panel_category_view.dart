import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import '../../../core/_core/router.dart';

class PanelCategoryView extends StatelessWidget {
  final Category category;
  const PanelCategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'PanelCategoryView',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${category.nom.getOrCrash()}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).primaryColor)),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),
              if (category.subcategory != null)
                category.subcategory!.fold((failure) => AppError(message: failure.toString()),
                    (List<Category> listCategory) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listCategory.map((Category category) {
                        return _PanelSubCategoryView(category: category);
                      }).toList());
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class _PanelSubCategoryView extends StatelessWidget {
  final Category category;
  const _PanelSubCategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_PanelSubCategoryView',
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
        child: InkWell(
          onTap: () {
            printDev();
            //On ouvre la catégorie suivante ou bien la liste des ressources associés à la catégorie
            if (this.category.listResource == null || this.category.listResource == [])
              context.router.push(CategoryViewRoute(category: category));
            else
              context.router.push(Resource_viewRoute(category: category));
          },
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText("${category.nom.getOrCrash()}",
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
