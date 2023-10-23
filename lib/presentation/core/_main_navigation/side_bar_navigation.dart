import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_icons.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Menu latéral de navigation
class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
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
                    width: 300,
                    child: SideMenu(listMenu: listMenu),
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

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.listMenu,
  });

  final List listMenu;

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return ListView(
      children: [
        //Titre
        _Title(tabsRouter: tabsRouter),
        SpaceH20(),
        //Liste des liens
        ...listMenu.map((element) => NavLink(
              title: element["title"],
              icon: element["icon"],
              route: element["id"],
              tabsRouter: tabsRouter,
            )),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        printDev();
        context.router.replaceAll([AssistantRoute()]);
        tabsRouter.setActiveIndex(1);
        ref.read(currentPageNavProvider.notifier).state = 1;
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Icon(
          MyFlutterApp.logo_noir,
          size: 60,
          color: const Color.fromARGB(255, 0, 255, 8),
        ),
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
      child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          tileColor: idCurrentPage == route ? colorpanel(700) : null,
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
