import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/panel_category_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CategoryListPageMode { mediatheque, notice_constructeur, pieces_fournisseurs }

extension CategoryListPageModeExtension on CategoryListPageMode {
  String get title {
    switch (this) {
      case CategoryListPageMode.mediatheque:
        return 'Mediatheque';
      case CategoryListPageMode.notice_constructeur:
        return 'Notice Constructeur';
      case CategoryListPageMode.pieces_fournisseurs:
        return 'Pièces et Fournisseurs';
    }
  }

  CollectionReference<Object?> getCollection(FirebaseFirestore _firestore) {
    switch (this) {
      case CategoryListPageMode.mediatheque:
        return _firestore.mediathequeCollection;
      case CategoryListPageMode.notice_constructeur:
        return _firestore.noticeConstucteurCollection;
      case CategoryListPageMode.pieces_fournisseurs:
        return _firestore.pieceFournisseurCollection;
    }
  }
}

@RoutePage()
class CategoryListPage extends ConsumerWidget {
  final CategoryListPageMode mode;
  const CategoryListPage(
    this.mode, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: mode.title,
      child: ShowComponentFile(
        title: 'CategoryListPage',
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppAsync(
              ref.watch(categoryListProvider(mode)),
              builder: (data) => data!.fold(
                  (error) => AppError(message: error.toString()),
                  (listCategory) => ListView(children: [
                        ...listCategory
                            .map<Widget>((categoryObj) => PanelCategoryView(category: categoryObj))
                            .toList()
                      ])),
            )),
      ),
    );
  }
}
