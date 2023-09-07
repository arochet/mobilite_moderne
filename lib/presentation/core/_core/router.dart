import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/components/components_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/text_style/text_style.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/delete_account/delete_account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/modify_account/modify_account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/new_password/new_password_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/reauthenticate/reauthenticate_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_check_email/auth_check_email_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_init/auth_init_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_register/auth_register_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password_page.dart';
import 'package:mobilite_moderne/PRESENTATION/home/home_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_splash/splash_page.dart';
import 'package:flutter/material.dart';
import '../../account/account/buttons/buttons.dart';
import '../../account/account/colors/colors.dart';
import '../../account/account/utils/utils_page.dart';
//insert-import
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
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
              path: 'account',
              page: AccountRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/auth-init',
          page: AuthInitRoute.page,
        ),
        AutoRoute(
          path: '/auth-connexion',
          page: AuthConnexionRoute.page,
        ),
        AutoRoute(
          path: '/auth-register',
          page: AuthRegisterRoute.page,
        ),
        AutoRoute(
          path: '/auth-check-email',
          page: AuthCheckEmailRoute.page,
        ),
        AutoRoute(
          path: '/auth-reset-password',
          page: AuthResetPasswordRoute.page,
        ),
        AutoRoute(
          path: '/modify-account',
          page: ModifyAccountRoute.page,
        ),
        AutoRoute(
          path: '/reauthenticate',
          page: ReauthenticateRoute.page,
        ),
        AutoRoute(
          path: '/delete-account',
          page: DeleteAccountRoute.page,
        ),
        AutoRoute(
          path: '/new-password',
          page: NewPasswordRoute.page,
        ),
        AutoRoute(
          path: '/components-route',
          page: ComponentsRoute.page,
        ),
        AutoRoute(
          path: '/colors-route',
          page: ColorsRoute.page,
        ),
        AutoRoute(
          path: '/buttons-route',
          page: ButtonsRoute.page,
        ),
        AutoRoute(
          path: '/textStyle-route',
          page: TextStyleRoute.page,
        ),
        AutoRoute(
          path: '/utils-route',
          page: UtilsRoute.page,
        ),
        //insert-route
      ];
}
