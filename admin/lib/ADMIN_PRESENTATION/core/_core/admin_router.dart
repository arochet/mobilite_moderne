import 'package:admin/ADMIN_PRESENTATION/core/_splash/splash_page.dart';
import 'package:admin/ADMIN_PRESENTATION/home/home_page.dart';
import 'package:admin/ADMIN_PRESENTATION/news/news_page.dart';
import 'package:admin/ADMIN_PRESENTATION/users/users_page.dart';
import 'package:admin/ADMIN_PRESENTATION/auth/auth_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';

import '../_main_navigation/main_navigation_page.dart';
//insert-import
part 'admin_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AdminRouter extends _$AdminRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/main',
          page: MainNavigationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'users',
              page: UsersRoute.page,
            ),
            AutoRoute(
              path: 'news',
              page: AdminNewsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/auth-route',
          page: AuthRoute.page,
        ),
        //insert-route
      ];
}
