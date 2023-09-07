import 'package:admin/ADMIN_PRESENTATION/core/_components/app_bar.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarNavigation extends ConsumerWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const env = 'dev';
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => buildAppBar(context, ref, 'ADMIN')!,
      backgroundColor: colorpanel(900),
      routes: listRoute,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            backgroundColor: colorpanel(700),
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (int id) {
              tabsRouter.setActiveIndex(id);
              printDev();
            },
            selectedLabelStyle: TextStyle(
              fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
              fontWeight: FontWeight.w600,
            ),
            items: listMenu
                .map(
                  (element) => BottomNavigationBarItem(
                    icon: Icon(element["icon"]),
                    label: element["title"],
                  ),
                )
                .toList());
      },
    );
  }
}
