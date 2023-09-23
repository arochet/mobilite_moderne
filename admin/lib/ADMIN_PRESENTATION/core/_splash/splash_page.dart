import 'package:admin/ADMIN_APPLICATION/user/auth_notifier.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../_components/app_loading.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.router.replaceAll([MainNavigationRoute()]);

    final authState = ref.watch(authNotifierProvider);
    if (authState is AuthAuthenticated) {
      Future.delayed(Duration.zero, () async {
        ref.read(currentPageNavProvider.notifier).state = 0;
        context.router.replaceAll([MainNavigationRoute()]);
      });
    } else if (authState is AuthUnauthenticated) {
      Future.delayed(Duration.zero, () async {
        context.router.replaceAll([AuthRoute()]);
      });
    }
    return const Scaffold(body: AppLoading());
  }
}
