import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_bar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_utils/dev_utils.dart';

/// Menu de navigation en bas de l'écran pour la page principale
class BottomBarNavigation extends ConsumerWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environment.notifier).state.name;
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => buildAppBar(context, ref, 'Dist Atelier',
          color: tabsRouter.activeIndex != 3 ? colorpanel(900) : colorpanel(800))!,
      backgroundColor: colorpanel(900),
      routes: listRoute,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            backgroundColor: tabsRouter.activeIndex != 3 ? colorpanel(900) : colorpanel(800),
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (int id) {
              tabsRouter.setActiveIndex(id);

              //Met à jour les actualités quand on arrive sur la page
              if (id == 1) {
                ref.invalidate(categoryListProvider);
              }
              if (id == 2) {
                ref.invalidate(allNewsProvider);
              }
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
