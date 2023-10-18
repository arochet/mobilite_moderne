import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/search_algolia/search_algolia.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/panel_category_list.dart';

@RoutePage()
class Resource_menuPage extends StatelessWidget {
  const Resource_menuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'Resource_menuPage',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SearchAlgolia(
          child: Align(
            child: Container(
                constraints: BoxConstraints(maxWidth: 500),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      // CHOIX DU TYPE DE RESSOURCE
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TabBar(
                          tabs: ResourceMainCategory.values.map((e) {
                            return Tab(text: e.titleBar);
                          }).toList(),
                        ),
                      ),
                      // LES CATEGORIES
                      Expanded(
                        child: TabBarView(
                          children: ResourceMainCategory.values.map((mode) {
                            return PanelCategoryList(mode);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
