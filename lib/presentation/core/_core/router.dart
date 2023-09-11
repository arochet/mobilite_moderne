import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
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
import 'package:mobilite_moderne/PRESENTATION/assistant/home_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_splash/splash_page.dart';
import 'package:flutter/material.dart';
import '../../account/account/buttons/buttons.dart';
import '../../account/account/colors/colors.dart';
import '../../account/account/utils/utils_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./news/news_add/news_add_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./news/news_list/news_list_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./news/news_view/news_view_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/term_of_use/term_of_use_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/privacy_policy/privacy_policy_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./article/article_add/article_add_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./article/article_list/article_list_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./article/article_view/article_view_page.dart'; //insert-import
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
              path: 'news-list-route',
              page: NewsListRoute.page,
            ),
            AutoRoute(
              path: 'article-list-route',
              page: ArticleListRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/account',
          page: AccountRoute.page,
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
        AutoRoute(
          path: '/news-add-route',
          page: NewsAddRoute.page,
        ),

        AutoRoute(
          path: '/news-view-route',
          page: NewsViewRoute.page,
        ),
        AutoRoute(
          path: '/term_of_use-route',
          page: Term_of_useRoute.page,
        ),
        AutoRoute(
          path: '/privacy_policy-route',
          page: Privacy_policyRoute.page,
        ),
        AutoRoute(
          path: '/article-add-route',
          page: ArticleAddRoute.page,
        ),
        AutoRoute(
          path: '/article-view-route',
          page: ArticleViewRoute.page,
        ), //insert-route
      ];
}
