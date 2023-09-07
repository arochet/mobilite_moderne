import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/widget/check_connexion_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import 'side_bar_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Page de navigation principale de l'application
@RoutePage()
class MainNavigationPage extends StatelessWidget {
  MainNavigationPage({Key? key}) : super(key: key);

  final listRoute = [
    HomeRoute(),
    AccountRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final listMenu = [
      {
        "title": AppLocalizations.of(context)!.accueil,
        "icon": Icons.home,
        "id": 0,
      },
      {
        "title": AppLocalizations.of(context)!.compte,
        "icon": Icons.person_rounded,
        "id": 1,
      },
    ];
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
