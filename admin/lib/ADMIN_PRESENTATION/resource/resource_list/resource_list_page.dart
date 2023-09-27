import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/providers.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';

import 'widget/panel_resource_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class ResourceListPage extends ConsumerWidget {
  const ResourceListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppAsync(
          ref.watch(allResourceProvider),
          builder: (data) => data!.fold(
              (error) => AppError(message: error.toString()),
              (listResource) => Column(
                    children: [
                      //Titre
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                          child: Text(
                            "${listResource.length} ressources",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      //Liste des ressources
                      Expanded(
                        child: ListView(
                            children: listResource
                                .map<Widget>((resourceObj) => PanelResourceView(resource: resourceObj))
                                .toList()),
                      ),

                      //Bouton d'ajout
                      ElevatedButton(
                        onPressed: () {
                          context.router.push(ResourceAddRoute());
                        },
                        child: Text("Ajouter une ressource"),
                      ),
                    ],
                  )),
        ));
  }
}
