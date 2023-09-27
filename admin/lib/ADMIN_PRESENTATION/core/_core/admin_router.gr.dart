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
    AdminNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminNewsPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    Choice_categoryRoute.name: (routeData) {
      final args = routeData.argsAs<Choice_categoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Choice_categoryPage(
          args.idResource,
          args.category,
          args.canChoiceCategory,
          key: args.key,
        ),
      );
    },
    ConversationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConversationListPage(),
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
    MessageChatRoute.name: (routeData) {
      final args = routeData.argsAs<MessageChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MessageChatPage(
          args.idUser,
          key: args.key,
        ),
      );
    },
    NewsAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsAddPage(),
      );
    },
    ResourceAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResourceAddPage(),
      );
    },
    ResourceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResourceListPage(),
      );
    },
    ResourceViewRoute.name: (routeData) {
      final args = routeData.argsAs<ResourceViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResourceViewPage(
          id: args.id,
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
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
  };
}

/// generated route for
/// [AdminNewsPage]
class AdminNewsRoute extends PageRouteInfo<void> {
  const AdminNewsRoute({List<PageRouteInfo>? children})
      : super(
          AdminNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [Choice_categoryPage]
class Choice_categoryRoute extends PageRouteInfo<Choice_categoryRouteArgs> {
  Choice_categoryRoute({
    required UniqueId idResource,
    required AppCategory category,
    required bool canChoiceCategory,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Choice_categoryRoute.name,
          args: Choice_categoryRouteArgs(
            idResource: idResource,
            category: category,
            canChoiceCategory: canChoiceCategory,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Choice_categoryRoute';

  static const PageInfo<Choice_categoryRouteArgs> page =
      PageInfo<Choice_categoryRouteArgs>(name);
}

class Choice_categoryRouteArgs {
  const Choice_categoryRouteArgs({
    required this.idResource,
    required this.category,
    required this.canChoiceCategory,
    this.key,
  });

  final UniqueId idResource;

  final AppCategory category;

  final bool canChoiceCategory;

  final Key? key;

  @override
  String toString() {
    return 'Choice_categoryRouteArgs{idResource: $idResource, category: $category, canChoiceCategory: $canChoiceCategory, key: $key}';
  }
}

/// generated route for
/// [ConversationListPage]
class ConversationListRoute extends PageRouteInfo<void> {
  const ConversationListRoute({List<PageRouteInfo>? children})
      : super(
          ConversationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConversationListRoute';

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
/// [MessageChatPage]
class MessageChatRoute extends PageRouteInfo<MessageChatRouteArgs> {
  MessageChatRoute({
    required UniqueId idUser,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MessageChatRoute.name,
          args: MessageChatRouteArgs(
            idUser: idUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageChatRoute';

  static const PageInfo<MessageChatRouteArgs> page =
      PageInfo<MessageChatRouteArgs>(name);
}

class MessageChatRouteArgs {
  const MessageChatRouteArgs({
    required this.idUser,
    this.key,
  });

  final UniqueId idUser;

  final Key? key;

  @override
  String toString() {
    return 'MessageChatRouteArgs{idUser: $idUser, key: $key}';
  }
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
/// [ResourceAddPage]
class ResourceAddRoute extends PageRouteInfo<void> {
  const ResourceAddRoute({List<PageRouteInfo>? children})
      : super(
          ResourceAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResourceAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResourceListPage]
class ResourceListRoute extends PageRouteInfo<void> {
  const ResourceListRoute({List<PageRouteInfo>? children})
      : super(
          ResourceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResourceListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResourceViewPage]
class ResourceViewRoute extends PageRouteInfo<ResourceViewRouteArgs> {
  ResourceViewRoute({
    required UniqueId id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResourceViewRoute.name,
          args: ResourceViewRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResourceViewRoute';

  static const PageInfo<ResourceViewRouteArgs> page =
      PageInfo<ResourceViewRouteArgs>(name);
}

class ResourceViewRouteArgs {
  const ResourceViewRouteArgs({
    required this.id,
    this.key,
  });

  final UniqueId id;

  final Key? key;

  @override
  String toString() {
    return 'ResourceViewRouteArgs{id: $id, key: $key}';
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
