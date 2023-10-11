import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
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

  final listRouteMOBILE = [
    Subscription_stripeRoute(),
    AssistantRoute(),
    Resource_menuRoute(),
    NewsListRoute(),
  ];

  final listRouteWEB = [
    AssistantRoute(),
    Resource_menuRoute(),
    NewsListRoute(),
    AccountRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final listMenuMOBILE = [
      {
        "title": 'Home',
        "icon": Icons.home_sharp,
        "id": 0,
      },
      {
        "title": 'Assistant',
        "icon": Icons.settings,
        "id": 1,
      },
      {
        "title": 'Ressources',
        "icon": Icons.file_copy,
        "id": 2,
      },
      {
        "title": 'Actualités',
        "icon": Icons.newspaper,
        "id": 3,
      },
    ];
    final listMenuWEB = [
      /* {
        "title": 'Home',
        "icon": Icons.home_sharp,
        "id": 0,
      }, */
      {
        "title": 'Assistant',
        "icon": Icons.settings,
        "id": 0,
      },
      {
        "title": 'Ressources',
        "icon": Icons.file_copy,
        "id": 1,
      },
      {
        "title": 'Actualités',
        "icon": Icons.newspaper,
        "id": 2,
      },
      {
        "title": 'Compte',
        "icon": Icons.account_circle,
        "id": 3,
      },
    ];
    return CheckUserConnected(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600)
          return SideBarNavigation(
            listRoute: kIsWeb ? listRouteWEB : listRouteMOBILE,
            listMenu: kIsWeb ? listMenuWEB : listMenuMOBILE,
          );
        else
          return BottomBarNavigation(
            listRoute: kIsWeb ? listRouteWEB : listRouteMOBILE,
            listMenu: kIsWeb ? listMenuWEB : listMenuMOBILE,
          );
      }),
    );
  }
}
