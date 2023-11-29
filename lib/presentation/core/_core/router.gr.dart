// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    AnswerRoute.name: (routeData) {
      final args = routeData.argsAs<AnswerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnswerPage(
          key: args.key,
          choice: args.choice,
          filAriane: args.filAriane,
        ),
      );
    },
    AssistantRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssistantPage(),
      );
    },
    Assistant_visioRoute.name: (routeData) {
      final args = routeData.argsAs<Assistant_visioRouteArgs>(
          orElse: () => const Assistant_visioRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Assistant_visioPage(key: args.key),
      );
    },
    AuthCheckEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthCheckEmailPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthConnexionPage(),
      );
    },
    AuthInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthInitPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRegisterPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthResetPasswordPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ButtonsPage(),
      );
    },
    CategoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryViewPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    ChoiceRoute.name: (routeData) {
      final args = routeData.argsAs<ChoiceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChoicePage(
          key: args.key,
          choice: args.choice,
          filAriane: args.filAriane,
        ),
      );
    },
    ColorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ColorsPage(),
      );
    },
    ComponentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ComponentsPage(),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    Legal_mentionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Legal_mentionPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainNavigationPage(key: args.key),
      );
    },
    MessageListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessageListPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ModifyAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPasswordPage(),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListPage(),
      );
    },
    NewsViewRoute.name: (routeData) {
      final args = routeData.argsAs<NewsViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsViewPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    Privacy_policyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Privacy_policyPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    ResourcePdfViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ResourcePdfViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResourcePdfViewerPage(
          args.resource,
          key: args.key,
        ),
      );
    },
    ResourcePdfViewerWebRoute.name: (routeData) {
      final args = routeData.argsAs<ResourcePdfViewerWebRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResourcePdfViewerWebPage(
          args.resource,
          key: args.key,
        ),
      );
    },
    Resource_menuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Resource_menuPage(),
      );
    },
    Resource_videoplayerRoute.name: (routeData) {
      final args = routeData.argsAs<Resource_videoplayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Resource_videoplayerPage(
          args.resource,
          key: args.key,
        ),
      );
    },
    Resource_viewRoute.name: (routeData) {
      final args = routeData.argsAs<Resource_viewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Resource_viewPage(
          args.category,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    Subscription_errorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Subscription_errorPage(),
      );
    },
    Subscription_stripeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Subscription_stripePage(),
      );
    },
    Subscription_succesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Subscription_succesPage(),
      );
    },
    Term_of_useRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Term_of_usePage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UtilsPage(),
      );
    },
    VideoplayerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoplayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoplayerPage(
          args.path,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnswerPage]
class AnswerRoute extends PageRouteInfo<AnswerRouteArgs> {
  AnswerRoute({
    Key? key,
    required ChoiceWithAnswer choice,
    required String filAriane,
    List<PageRouteInfo>? children,
  }) : super(
          AnswerRoute.name,
          args: AnswerRouteArgs(
            key: key,
            choice: choice,
            filAriane: filAriane,
          ),
          initialChildren: children,
        );

  static const String name = 'AnswerRoute';

  static const PageInfo<AnswerRouteArgs> page = PageInfo<AnswerRouteArgs>(name);
}

class AnswerRouteArgs {
  const AnswerRouteArgs({
    this.key,
    required this.choice,
    required this.filAriane,
  });

  final Key? key;

  final ChoiceWithAnswer choice;

  final String filAriane;

  @override
  String toString() {
    return 'AnswerRouteArgs{key: $key, choice: $choice, filAriane: $filAriane}';
  }
}

/// generated route for
/// [AssistantPage]
class AssistantRoute extends PageRouteInfo<void> {
  const AssistantRoute({List<PageRouteInfo>? children})
      : super(
          AssistantRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssistantRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Assistant_visioPage]
class Assistant_visioRoute extends PageRouteInfo<Assistant_visioRouteArgs> {
  Assistant_visioRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Assistant_visioRoute.name,
          args: Assistant_visioRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Assistant_visioRoute';

  static const PageInfo<Assistant_visioRouteArgs> page =
      PageInfo<Assistant_visioRouteArgs>(name);
}

class Assistant_visioRouteArgs {
  const Assistant_visioRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'Assistant_visioRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AuthCheckEmailPage]
class AuthCheckEmailRoute extends PageRouteInfo<void> {
  const AuthCheckEmailRoute({List<PageRouteInfo>? children})
      : super(
          AuthCheckEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthCheckEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthConnexionPage]
class AuthConnexionRoute extends PageRouteInfo<void> {
  const AuthConnexionRoute({List<PageRouteInfo>? children})
      : super(
          AuthConnexionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConnexionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthInitPage]
class AuthInitRoute extends PageRouteInfo<void> {
  const AuthInitRoute({List<PageRouteInfo>? children})
      : super(
          AuthInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRegisterPage]
class AuthRegisterRoute extends PageRouteInfo<void> {
  const AuthRegisterRoute({List<PageRouteInfo>? children})
      : super(
          AuthRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthResetPasswordPage]
class AuthResetPasswordRoute extends PageRouteInfo<void> {
  const AuthResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          AuthResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ButtonsPage]
class ButtonsRoute extends PageRouteInfo<void> {
  const ButtonsRoute({List<PageRouteInfo>? children})
      : super(
          ButtonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ButtonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryViewPage]
class CategoryViewRoute extends PageRouteInfo<CategoryViewRouteArgs> {
  CategoryViewRoute({
    Key? key,
    required AppCategory category,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryViewRoute.name,
          args: CategoryViewRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryViewRoute';

  static const PageInfo<CategoryViewRouteArgs> page =
      PageInfo<CategoryViewRouteArgs>(name);
}

class CategoryViewRouteArgs {
  const CategoryViewRouteArgs({
    this.key,
    required this.category,
  });

  final Key? key;

  final AppCategory category;

  @override
  String toString() {
    return 'CategoryViewRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [ChoicePage]
class ChoiceRoute extends PageRouteInfo<ChoiceRouteArgs> {
  ChoiceRoute({
    Key? key,
    required ChoiceWithQuestions choice,
    required String filAriane,
    List<PageRouteInfo>? children,
  }) : super(
          ChoiceRoute.name,
          args: ChoiceRouteArgs(
            key: key,
            choice: choice,
            filAriane: filAriane,
          ),
          initialChildren: children,
        );

  static const String name = 'ChoiceRoute';

  static const PageInfo<ChoiceRouteArgs> page = PageInfo<ChoiceRouteArgs>(name);
}

class ChoiceRouteArgs {
  const ChoiceRouteArgs({
    this.key,
    required this.choice,
    required this.filAriane,
  });

  final Key? key;

  final ChoiceWithQuestions choice;

  final String filAriane;

  @override
  String toString() {
    return 'ChoiceRouteArgs{key: $key, choice: $choice, filAriane: $filAriane}';
  }
}

/// generated route for
/// [ColorsPage]
class ColorsRoute extends PageRouteInfo<void> {
  const ColorsRoute({List<PageRouteInfo>? children})
      : super(
          ColorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ColorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ComponentsPage]
class ComponentsRoute extends PageRouteInfo<void> {
  const ComponentsRoute({List<PageRouteInfo>? children})
      : super(
          ComponentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComponentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Legal_mentionPage]
class Legal_mentionRoute extends PageRouteInfo<void> {
  const Legal_mentionRoute({List<PageRouteInfo>? children})
      : super(
          Legal_mentionRoute.name,
          initialChildren: children,
        );

  static const String name = 'Legal_mentionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainNavigationRoute.name,
          args: MainNavigationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<MainNavigationRouteArgs> page =
      PageInfo<MainNavigationRouteArgs>(name);
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MessageListPage]
class MessageListRoute extends PageRouteInfo<void> {
  const MessageListRoute({List<PageRouteInfo>? children})
      : super(
          MessageListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ModifyAccountPage]
class ModifyAccountRoute extends PageRouteInfo<void> {
  const ModifyAccountRoute({List<PageRouteInfo>? children})
      : super(
          ModifyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModifyAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsListPage]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsViewPage]
class NewsViewRoute extends PageRouteInfo<NewsViewRouteArgs> {
  NewsViewRoute({
    required UniqueId id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NewsViewRoute.name,
          args: NewsViewRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsViewRoute';

  static const PageInfo<NewsViewRouteArgs> page =
      PageInfo<NewsViewRouteArgs>(name);
}

class NewsViewRouteArgs {
  const NewsViewRouteArgs({
    required this.id,
    this.key,
  });

  final UniqueId id;

  final Key? key;

  @override
  String toString() {
    return 'NewsViewRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [Privacy_policyPage]
class Privacy_policyRoute extends PageRouteInfo<void> {
  const Privacy_policyRoute({List<PageRouteInfo>? children})
      : super(
          Privacy_policyRoute.name,
          initialChildren: children,
        );

  static const String name = 'Privacy_policyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReauthenticatePage]
class ReauthenticateRoute extends PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    Key? key,
    required PageRouteInfo<dynamic> route,
    List<PageRouteInfo>? children,
  }) : super(
          ReauthenticateRoute.name,
          args: ReauthenticateRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'ReauthenticateRoute';

  static const PageInfo<ReauthenticateRouteArgs> page =
      PageInfo<ReauthenticateRouteArgs>(name);
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({
    this.key,
    required this.route,
  });

  final Key? key;

  final PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [ResourcePdfViewerPage]
class ResourcePdfViewerRoute extends PageRouteInfo<ResourcePdfViewerRouteArgs> {
  ResourcePdfViewerRoute({
    required Resource resource,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResourcePdfViewerRoute.name,
          args: ResourcePdfViewerRouteArgs(
            resource: resource,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResourcePdfViewerRoute';

  static const PageInfo<ResourcePdfViewerRouteArgs> page =
      PageInfo<ResourcePdfViewerRouteArgs>(name);
}

class ResourcePdfViewerRouteArgs {
  const ResourcePdfViewerRouteArgs({
    required this.resource,
    this.key,
  });

  final Resource resource;

  final Key? key;

  @override
  String toString() {
    return 'ResourcePdfViewerRouteArgs{resource: $resource, key: $key}';
  }
}

/// generated route for
/// [ResourcePdfViewerWebPage]
class ResourcePdfViewerWebRoute
    extends PageRouteInfo<ResourcePdfViewerWebRouteArgs> {
  ResourcePdfViewerWebRoute({
    required Resource resource,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResourcePdfViewerWebRoute.name,
          args: ResourcePdfViewerWebRouteArgs(
            resource: resource,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResourcePdfViewerWebRoute';

  static const PageInfo<ResourcePdfViewerWebRouteArgs> page =
      PageInfo<ResourcePdfViewerWebRouteArgs>(name);
}

class ResourcePdfViewerWebRouteArgs {
  const ResourcePdfViewerWebRouteArgs({
    required this.resource,
    this.key,
  });

  final Resource resource;

  final Key? key;

  @override
  String toString() {
    return 'ResourcePdfViewerWebRouteArgs{resource: $resource, key: $key}';
  }
}

/// generated route for
/// [Resource_menuPage]
class Resource_menuRoute extends PageRouteInfo<void> {
  const Resource_menuRoute({List<PageRouteInfo>? children})
      : super(
          Resource_menuRoute.name,
          initialChildren: children,
        );

  static const String name = 'Resource_menuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Resource_videoplayerPage]
class Resource_videoplayerRoute
    extends PageRouteInfo<Resource_videoplayerRouteArgs> {
  Resource_videoplayerRoute({
    required Resource resource,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Resource_videoplayerRoute.name,
          args: Resource_videoplayerRouteArgs(
            resource: resource,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Resource_videoplayerRoute';

  static const PageInfo<Resource_videoplayerRouteArgs> page =
      PageInfo<Resource_videoplayerRouteArgs>(name);
}

class Resource_videoplayerRouteArgs {
  const Resource_videoplayerRouteArgs({
    required this.resource,
    this.key,
  });

  final Resource resource;

  final Key? key;

  @override
  String toString() {
    return 'Resource_videoplayerRouteArgs{resource: $resource, key: $key}';
  }
}

/// generated route for
/// [Resource_viewPage]
class Resource_viewRoute extends PageRouteInfo<Resource_viewRouteArgs> {
  Resource_viewRoute({
    required AppCategory category,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Resource_viewRoute.name,
          args: Resource_viewRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Resource_viewRoute';

  static const PageInfo<Resource_viewRouteArgs> page =
      PageInfo<Resource_viewRouteArgs>(name);
}

class Resource_viewRouteArgs {
  const Resource_viewRouteArgs({
    required this.category,
    this.key,
  });

  final AppCategory category;

  final Key? key;

  @override
  String toString() {
    return 'Resource_viewRouteArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Subscription_errorPage]
class Subscription_errorRoute extends PageRouteInfo<void> {
  const Subscription_errorRoute({List<PageRouteInfo>? children})
      : super(
          Subscription_errorRoute.name,
          initialChildren: children,
        );

  static const String name = 'Subscription_errorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Subscription_stripePage]
class Subscription_stripeRoute extends PageRouteInfo<void> {
  const Subscription_stripeRoute({List<PageRouteInfo>? children})
      : super(
          Subscription_stripeRoute.name,
          initialChildren: children,
        );

  static const String name = 'Subscription_stripeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Subscription_succesPage]
class Subscription_succesRoute extends PageRouteInfo<void> {
  const Subscription_succesRoute({List<PageRouteInfo>? children})
      : super(
          Subscription_succesRoute.name,
          initialChildren: children,
        );

  static const String name = 'Subscription_succesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Term_of_usePage]
class Term_of_useRoute extends PageRouteInfo<void> {
  const Term_of_useRoute({List<PageRouteInfo>? children})
      : super(
          Term_of_useRoute.name,
          initialChildren: children,
        );

  static const String name = 'Term_of_useRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TextStylePage]
class TextStyleRoute extends PageRouteInfo<void> {
  const TextStyleRoute({List<PageRouteInfo>? children})
      : super(
          TextStyleRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextStyleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UtilsPage]
class UtilsRoute extends PageRouteInfo<void> {
  const UtilsRoute({List<PageRouteInfo>? children})
      : super(
          UtilsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtilsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoplayerPage]
class VideoplayerRoute extends PageRouteInfo<VideoplayerRouteArgs> {
  VideoplayerRoute({
    required String path,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VideoplayerRoute.name,
          args: VideoplayerRouteArgs(
            path: path,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoplayerRoute';

  static const PageInfo<VideoplayerRouteArgs> page =
      PageInfo<VideoplayerRouteArgs>(name);
}

class VideoplayerRouteArgs {
  const VideoplayerRouteArgs({
    required this.path,
    this.key,
  });

  final String path;

  final Key? key;

  @override
  String toString() {
    return 'VideoplayerRouteArgs{path: $path, key: $key}';
  }
}
