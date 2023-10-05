import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
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
                      child: Column(
                        children: [
                          const SpaceH10(),

                          //TITRE
                          Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Dist\'Atelier ADMIN',
                                    style: Theme.of(context).textTheme.titleLarge)),
                          ),
                          const SpaceH20(),

                          // MENU
                          ...listMenu.map((element) => NavLink(
                                title: element["title"],
                                icon: element["icon"],
                                route: element["id"],
                                tabsRouter: tabsRouter,
                              )),

                          Expanded(child: Container()),
                          // DECONNEXION
                          const _ButtonDeconnexion(),
                          const SpaceH20(),
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

class _ButtonDeconnexion extends ConsumerWidget {
  const _ButtonDeconnexion({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: () async {
          await ref.read(authNotifierProvider.notifier).signOut();
          context.router.replaceAll([AuthRoute()]);
        },
        child: const Text('Se déconnecter'),
      ),
    );
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
      child: InkWell(
        onTap: () {
          printDev();
          ref.read(currentPageNavProvider.notifier).state = route;
          tabsRouter.setActiveIndex(route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: idCurrentPage == route ? Theme.of(context).primaryColor : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(icon, color: idCurrentPage == route ? Colors.black : Colors.white),
                const SizedBox(width: 20),
                Expanded(
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: idCurrentPage == route ? Colors.black : Colors.white))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
