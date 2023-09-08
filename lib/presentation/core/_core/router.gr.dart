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
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
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
