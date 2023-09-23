// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'admin_router.dart';

abstract class _$AdminRouter extends RootStackRouter {
  // ignore: unused_element
  _$AdminRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
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
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
  };
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

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
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
