import 'package:admin/ADMIN_PRESENTATION/core/_components/app_error.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/main_scaffold.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/app_widget.dart';
import 'package:admin/providers.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

import 'widget/panel_resource_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ResourceViewPage extends ConsumerWidget {
  final UniqueId id;
  const ResourceViewPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        color: colorpanel(900),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppAsync(
            ref.watch(oneResourceProvider(id)),
            builder: (data) => data!.fold(
              (error) => AppError(message: error.toString()),
              (resource) => Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    PanelResourceView(resource: resource),
                    SpaceH10(),
                    ElevatedButton(
                        onPressed: () async {
                          await ref.read(resourceRepositoryProvider).delete(resource);
                          context.router.pop();
                        },
                        style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
                        child: const Text('Supprimer')),
                  ],
                ),
              )),
            ),
          ),
        ));
  }
}
