import 'package:admin/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_core/app_widget.dart';

class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final List<PageRouteInfo<dynamic>> listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: listRoute,
        transitionBuilder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  //MENU LATERAL
                  Container(
                    color: colorpanel(800),
                    child: SizedBox(
                      width: 300,
                      child: ListView(
                        children: [
                          const SpaceH10(),
                          Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Dist\'Atelier ADMIN',
                                    style: Theme.of(context).textTheme.titleLarge)),
                          ),
                          const SpaceH20(),
                          ...listMenu.map((element) => NavLink(
                                title: element["title"],
                                icon: element["icon"],
                                route: element["id"],
                                tabsRouter: tabsRouter,
                              )),
                        ],
                      ),
                    ),
                  ),
                  //PAGE
                  Expanded(
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class NavLink extends ConsumerWidget {
  const NavLink(
      {Key? key, this.title = 'link here', required this.route, required this.icon, required this.tabsRouter})
      : super(key: key);

  final String title;
  final int route;
  final TabsRouter tabsRouter;
  final IconData icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idCurrentPage = ref.watch(currentPageNavProvider.notifier).state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
      child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title),
          tileColor: idCurrentPage == route ? Theme.of(context).primaryColor : null,
          hoverColor: colorpanel(700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onTap: () {
            printDev();
            ref.read(currentPageNavProvider.notifier).state = route;
            tabsRouter.setActiveIndex(route);
          }),
    );
  }
}
