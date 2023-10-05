import 'package:auto_route/auto_route.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import 'side_bar_navigation.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  MainNavigationPage({Key? key}) : super(key: key);

  final listRoute = [
    const UsersRoute(),
    const ResourceListRoute(),
    const AdminNewsRoute(),
    const ConversationListRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final listMenu = [
      {
        "title": 'Users',
        "icon": Icons.person_rounded,
        "id": 0,
      },
      {
        "title": 'Resources',
        "icon": Icons.file_copy,
        "id": 1,
      },
      {
        "title": 'Actualités',
        "icon": Icons.newspaper,
        "id": 2,
      },
      {
        "title": 'Messages',
        "icon": Icons.message,
        "id": 3,
      },
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
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
      },
    );
  }
}
