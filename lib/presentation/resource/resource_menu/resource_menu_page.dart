import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../category_list/category_list_page.dart';

@RoutePage()
class Resource_menuPage extends StatelessWidget {
  const Resource_menuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image du logo
            Image.asset(
              AssetsImage.logo,
              width: 100,
            ),
            SizedBox(height: 70),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  printDev();
                  context.router.push(CategoryListRoute(mode: CategoryListPageMode.notice_constructeur));
                },
                child: Text("Notice Constructeur"),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  printDev();
                  context.router.push(CategoryListRoute(mode: CategoryListPageMode.pieces_fournisseurs));
                },
                child: Text("Pièces et Fournisseurs"),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
