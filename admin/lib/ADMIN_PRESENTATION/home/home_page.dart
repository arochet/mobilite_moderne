import 'package:admin/ADMIN_PRESENTATION/core/_components/spacing.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SpaceH10(),
            const Center(child: Text('HOME')),
            SpaceH10(),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authNotifierProvider.notifier).signOut();
                context.router.replaceAll([AuthRoute()]);
              },
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
