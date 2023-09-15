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
    AssistantRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssistantPage(),
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
    CategoryListRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryListPage(
          args.mode,
          key: args.key,
        ),
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
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainNavigationPage(key: args.key),
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
    NewsAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsAddPage(),
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
    PdfViewerRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PdfViewerPage(
          args.name,
          args.url,
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
    Ressources_menuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Ressources_menuPage(),
      );
    },
    Ressources_viewRoute.name: (routeData) {
      final args = routeData.argsAs<Ressources_viewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Ressources_viewPage(
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
/// [CategoryListPage]
class CategoryListRoute extends PageRouteInfo<CategoryListRouteArgs> {
  CategoryListRoute({
    required CategoryListPageMode mode,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryListRoute.name,
          args: CategoryListRouteArgs(
            mode: mode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const PageInfo<CategoryListRouteArgs> page =
      PageInfo<CategoryListRouteArgs>(name);
}

class CategoryListRouteArgs {
  const CategoryListRouteArgs({
    required this.mode,
    this.key,
  });

  final CategoryListPageMode mode;

  final Key? key;

  @override
  String toString() {
    return 'CategoryListRouteArgs{mode: $mode, key: $key}';
  }
}

/// generated route for
/// [CategoryViewPage]
class CategoryViewRoute extends PageRouteInfo<CategoryViewRouteArgs> {
  CategoryViewRoute({
    Key? key,
    required Category category,
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

  final Category category;

  @override
  String toString() {
    return 'CategoryViewRouteArgs{key: $key, category: $category}';
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
/// [NewsAddPage]
class NewsAddRoute extends PageRouteInfo<void> {
  const NewsAddRoute({List<PageRouteInfo>? children})
      : super(
          NewsAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsAddRoute';

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
/// [PdfViewerPage]
class PdfViewerRoute extends PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    required String name,
    required String url,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PdfViewerRoute.name,
          args: PdfViewerRouteArgs(
            name: name,
            url: url,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewerRoute';

  static const PageInfo<PdfViewerRouteArgs> page =
      PageInfo<PdfViewerRouteArgs>(name);
}

class PdfViewerRouteArgs {
  const PdfViewerRouteArgs({
    required this.name,
    required this.url,
    this.key,
  });

  final String name;

  final String url;

  final Key? key;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{name: $name, url: $url, key: $key}';
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
/// [Ressources_menuPage]
class Ressources_menuRoute extends PageRouteInfo<void> {
  const Ressources_menuRoute({List<PageRouteInfo>? children})
      : super(
          Ressources_menuRoute.name,
          initialChildren: children,
        );

  static const String name = 'Ressources_menuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Ressources_viewPage]
class Ressources_viewRoute extends PageRouteInfo<Ressources_viewRouteArgs> {
  Ressources_viewRoute({
    required Category category,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Ressources_viewRoute.name,
          args: Ressources_viewRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Ressources_viewRoute';

  static const PageInfo<Ressources_viewRouteArgs> page =
      PageInfo<Ressources_viewRouteArgs>(name);
}

class Ressources_viewRouteArgs {
  const Ressources_viewRouteArgs({
    required this.category,
    this.key,
  });

  final Category category;

  final Key? key;

  @override
  String toString() {
    return 'Ressources_viewRouteArgs{category: $category, key: $key}';
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
