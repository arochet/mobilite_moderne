import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

import 'panel_category_view.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanelCategoryList extends ConsumerWidget {
  final ResourceMainCategory mode;
  const PanelCategoryList(
    this.mode, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'CategoryListPage',
      child: AppAsync(
        ref.watch(categoryListProvider(mode)),
        builder: (data) => data!.fold(
            (error) => AppError(message: error.toString()),
            (listCategory) => ListView(children: [
                  ...listCategory
                      .map<Widget>((categoryObj) => PanelCategoryView(category: categoryObj))
                      .toList()
                ])),
      ),
    );
  }
}
