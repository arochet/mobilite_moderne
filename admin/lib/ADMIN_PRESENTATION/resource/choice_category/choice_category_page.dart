import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category_failure.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Choice_categoryPage extends ConsumerWidget {
  final UniqueId idResource;
  final AppCategory category;

  /// L'utilisateur arrive sur la page et peut choisir la catégorie en cours
  /// Sinon il choisit une sous catégorie
  final bool canChoiceCategory;
  const Choice_categoryPage(this.idResource, this.category, this.canChoiceCategory, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: 'Choix de la catégorie',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: canChoiceCategory
              ? _ChoiceThisCategory(idResource, category)
              : _ChoiceCategory(idResource, category),
        ),
      ),
    );
  }
}

class _ChoiceCategory extends ConsumerWidget {
  final UniqueId idResource;
  final AppCategory category;
  const _ChoiceCategory(this.idResource, this.category, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppAsync(
      ref.watch(categoryViewProvider(category)),
      builder: (data) => data!.fold(
          (error) => AppError(message: error.toString()),
          (listCategory) => listCategory.length > 0
              ? ListView.separated(
                  itemCount: listCategory.length,
                  itemBuilder: (context, index) => _PanelCategoryView(
                    category: listCategory[index],
                    idResource: idResource,
                  ),
                  separatorBuilder: (context, index) => Divider(),
                )
              : Center(child: Text('Aucune catégorie trouvée'))),
    );
  }
}

class _PanelCategoryView extends StatelessWidget {
  final AppCategory category;
  final UniqueId idResource;
  const _PanelCategoryView({Key? key, required this.category, required this.idResource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_PanelCategoryView',
      child: InkWell(
        onTap: () async {
          printDev();
          //On ouvre la catégorie suivante ou bien la liste des ressources associés à la catégorie
          context.router.push(Choice_categoryRoute(
              idResource: idResource, category: category, canChoiceCategory: !this.category.hasSubcategory));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Text("${category.nom.getOrCrash()}", style: Theme.of(context).textTheme.titleMedium),
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

class _ChoiceThisCategory extends ConsumerWidget {
  final UniqueId idResource;
  final AppCategory category;
  const _ChoiceThisCategory(this.idResource, this.category, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          child: Column(
            children: [
              Text('${category.nom.getOrCrash()}', style: Theme.of(context).textTheme.titleMedium),
              SpaceH10(),
              Text('${category.path}', style: Theme.of(context).textTheme.titleSmall),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () async {
                  final Either<AppCategoryFailure, Unit> result =
                      await ref.read(resourceRepositoryProvider).addResourceToCategory(category, idResource);

                  result.fold((l) => showSnackBar(context, l.toString()), (_) {
                    context.router.replaceAll([ResourceListRoute()]);
                  });
                },
                child: const Text("Choisir"),
              ),
              SpaceH10(),
            ],
          ),
        ),
      )),
    );
  }
}
