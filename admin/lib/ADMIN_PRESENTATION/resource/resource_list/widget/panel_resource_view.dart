import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';

class PanelResourceView extends StatelessWidget {
  final Resource resource;
  const PanelResourceView({Key? key, required this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(resource.type.icon, color: Colors.white),
      title: Text('${resource.nom.getOrCrash()}', style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(resource.keyword.join(' - '), style: Theme.of(context).textTheme.bodySmall),
      onTap: () {
        context.router.push(ResourceViewRoute(id: resource.id));
      },
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
