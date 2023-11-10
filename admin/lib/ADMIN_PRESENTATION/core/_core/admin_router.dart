import 'package:admin/ADMIN_PRESENTATION/core/_splash/splash_page.dart';
import 'package:admin/ADMIN_PRESENTATION/home/home_page.dart';
import 'package:admin/ADMIN_PRESENTATION/message/conversation_list/conversation_list_page.dart';
import 'package:admin/ADMIN_PRESENTATION/message/message_chat/message_chat_page.dart';
import 'package:admin/ADMIN_PRESENTATION/news/news_add/news_add_page.dart';
import 'package:admin/ADMIN_PRESENTATION/news/news_home/news_page.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/choice_category/choice_category_page.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_add/resource_add_page.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_list/resource_list_page.dart';
import 'package:admin/ADMIN_PRESENTATION/resource/resource_view/resource_view_page.dart';
import 'package:admin/ADMIN_PRESENTATION/users/users_page.dart';
import 'package:admin/ADMIN_PRESENTATION/auth/auth_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';

import '../_main_navigation/main_navigation_page.dart';
//insert-import
part 'admin_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AdminRouter extends _$AdminRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
        //AutoRoute(path: '*', page: SplashRoute.page),
        AutoRoute(
          path: '/main',
          page: MainNavigationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'users'),
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'users',
              page: UsersRoute.page,
            ),
            AutoRoute(
              path: 'resource-list-route',
              page: ResourceListRoute.page,
            ),
            AutoRoute(
              path: 'news',
              page: AdminNewsRoute.page,
            ),
            AutoRoute(
              path: 'conversation-list-route',
              page: ConversationListRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/auth-route',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/news-add-route',
          page: NewsAddRoute.page,
        ),
        AutoRoute(
          path: '/resource-add-route',
          page: ResourceAddRoute.page,
        ),
        AutoRoute(
          path: '/resource-view-route',
          page: ResourceViewRoute.page,
        ),
        AutoRoute(
          path: '/choice-category-route',
          page: Choice_categoryRoute.page,
        ),
        AutoRoute(
          path: '/message-chat-route',
          page: MessageChatRoute.page,
        ),
        AutoRoute(
          path: '/message-chat-route',
          page: MessageChatRoute.page,
        ),
        //insert-route
      ];
}
