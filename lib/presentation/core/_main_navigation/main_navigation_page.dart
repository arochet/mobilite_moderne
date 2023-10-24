import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/check_connexion_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_icons.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import 'side_bar_navigation.dart';

final listMenu = [
  {
    "title": 'Assistance',
    "icon": MyFlutterApp.assistance,
    "id": 0,
  },
  {
    "title": 'Ressources',
    "icon": MyFlutterApp.ressources,
    "id": 1,
  },
  {
    "title": 'Actualités',
    "icon": Icons.notifications_active_outlined,
    "id": 2,
  },
  {
    "title": 'Compte',
    "icon": Icons.account_circle_outlined,
    "id": 3,
  },
];

/// Page de navigation principale de l'application
@RoutePage()
class MainNavigationPage extends StatelessWidget {
  MainNavigationPage({Key? key}) : super(key: key);

  final listRoute = [
    AssistantRoute(),
    Resource_menuRoute(),
    NewsListRoute(),
    AccountRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return CheckUserConnected(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600)
          return SideBarNavigation(
            listRoute: listRoute,
            listMenu: listMenu,
          );
        else
          return BottomBarNavigation(
            listRoute: listRoute,
            listMenu: listMenu,
          );
      }),
    );
  }
}
