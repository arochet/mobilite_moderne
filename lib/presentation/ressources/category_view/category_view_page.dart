import 'package:another_flushbar/flushbar_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/_components/app_error.dart';

@RoutePage()
class CategoryPage extends ConsumerWidget {
  final Category category;
  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: '${category.nom.getOrCrash()}',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AppAsync(
            ref.watch(childrenCategoryProvider(category)),
            builder: (data) => data!.fold(
                (error) => AppError(message: error.toString()),
                (listCategory) => ListView(children: [
                      ...listCategory
                          .map<Widget>((categoryObj) => _PanelCategoryView(category: categoryObj))
                          .toList()
                    ])),
          ),
        ),
      ),
    );
  }
}

class _PanelCategoryView extends StatelessWidget {
  final Category category;
  const _PanelCategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_PanelCategoryView',
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
        child: InkWell(
          onTap: () async {
            printDev();
            //On ouvre la catégorie suivante ou bien la liste des ressources associés à la catégorie
            if (this.category.listDocument == null)
              context.router.push(CategoryRoute(category: category));
            else
              context.router.push(Ressources_viewRoute(category: category));
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
