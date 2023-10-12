import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/account/developpement/components/components_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/developpement/text_style/text_style.dart';
import 'package:mobilite_moderne/PRESENTATION/account/account/account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/delete_account/delete_account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/modify_account/modify_account_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/new_password/new_password_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/reauthenticate/reauthenticate_page.dart';
import 'package:mobilite_moderne/PRESENTATION/assistant/assistant_home/assistant_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_check_email/auth_check_email_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_init/auth_init_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_register/auth_register_page.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/home/home_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/resource_videoplayer/resource_videoplayer_page.dart';
import '../../account/developpement/buttons/buttons.dart';
import '../../account/developpement/colors/colors.dart';
import '../../account/developpement/utils/utils_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./news/news_list/news_list_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./news/news_view/news_view_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/term_of_use/term_of_use_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/privacy_policy/privacy_policy_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/category_list/category_list_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/category_view/category_view_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/resource_view/resource_view_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/resource_menu/resource_menu_page.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/resource_pdf_viewer/pdfviewer_page.dart';
import 'package:mobilite_moderne/PRESENTATION/assistant/assistant_diagnostic/choice/choice_page.dart';
import 'package:mobilite_moderne/PRESENTATION/assistant/assistant_diagnostic/answer/answer_page.dart';
import 'package:mobilite_moderne/PRESENTATION/assistant/assistant_visio/assistant_visio_page.dart';
import 'package:mobilite_moderne/PRESENTATION/./message/message_list/message_list_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/subscription/subscription_page.dart';
import 'package:mobilite_moderne/PRESENTATION/account/legal_mention/legal_mention_page.dart'; //insert-import
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
        AutoRoute(path: '*', page: SplashRoute.page),
        AutoRoute(
          path: '/',
          page: MainNavigationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(
              path: 'home',
              page: Subscription_stripeRoute.page,
            ),
            AutoRoute(
              path: 'assistant',
              page: AssistantRoute.page,
            ),
            AutoRoute(
              path: 'ressources_menu-route',
              page: Resource_menuRoute.page,
            ),
            AutoRoute(
              path: 'news-list-route',
              page: NewsListRoute.page,
            ),
            AutoRoute(
              path: 'account',
              page: AccountRoute.page,
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
          path: '/category-route',
          page: CategoryViewRoute.page,
        ),
        AutoRoute(
          path: '/category_list-route',
          page: CategoryListRoute.page,
        ),
        AutoRoute(
          path: '/ressources_view-route',
          page: Resource_viewRoute.page,
        ),
        AutoRoute(
          path: '/pdfViewer-route',
          page: ResourcePdfViewerRoute.page,
        ),
        AutoRoute(
          path: '/choice-route',
          page: ChoiceRoute.page,
        ),
        AutoRoute(
          path: '/answer-route',
          page: AnswerRoute.page,
        ),
        AutoRoute(
          path: '/resource_videoplayer-route',
          page: Resource_videoplayerRoute.page,
        ),
        AutoRoute(
          path: '/assistant_visio-route',
          page: Assistant_visioRoute.page,
        ),
        AutoRoute(
          path: '/message-list-route',
          page: MessageListRoute.page,
        ),
        AutoRoute(
          path: '/subscription_stripe-route',
          page: Subscription_stripeRoute.page,
        ),
        AutoRoute(
          path: '/legal_mention-route',
          page: Legal_mentionRoute.page,
        ), //insert-route
      ];
}
