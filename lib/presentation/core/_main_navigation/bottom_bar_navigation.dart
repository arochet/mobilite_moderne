import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_bar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_utils/dev_utils.dart';

/// Menu de navigation en bas de l'écran pour la page principale
class BottomBarNavigation extends ConsumerWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  PreferredSizeWidget _appBar(context, ref, int index, sizeHeight) {
    if (index == 0) {
      return buildAppBarAssistance(context, sizeHeight);
    } else {
      return buildAppBar(context, ref, 'Dist Atelier',
          color: index != 3 ? colorpanel(900) : colorpanel(800))!;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environment.notifier).state.name;

    final sizeHeight = MediaQuery.of(context).size.height * 0.4;
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => _appBar(context, ref, tabsRouter.activeIndex, sizeHeight),
      backgroundColor: colorpanel(900),
      routes: listRoute,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            backgroundColor: tabsRouter.activeIndex != 3 ? colorpanel(900) : colorpanel(800),
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).textTheme.titleLarge?.color,
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
                    activeIcon: CircleAvatar(
                      radius: 16,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(element["icon"], color: Theme.of(context).textTheme.titleLarge?.color),
                    ),
                    icon: Icon(element["icon"]),
                    label: element["title"],
                  ),
                )
                .toList());
      },
    );
  }
}
