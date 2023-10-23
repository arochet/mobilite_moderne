import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

class PanelResourceView extends StatelessWidget {
  final Resource resource;
  const PanelResourceView({Key? key, required this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceH10(),
            Text("${resource.nom.getOrCrash()}", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Text("ID: ${resource.id.getOrCrash()}", style: Theme.of(context).textTheme.labelMedium),
            Text("Type : ${resource.type.name}", style: Theme.of(context).textTheme.labelMedium),
            const SpaceH20(),
            Text('Description Courte', style: Theme.of(context).textTheme.bodyMedium),
            Text(resource.shortDescription, style: Theme.of(context).textTheme.labelLarge),
            const SpaceH20(),
            Text('Description', style: Theme.of(context).textTheme.bodyMedium),
            Container(
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                    child: Text(resource.description, style: Theme.of(context).textTheme.labelLarge))),
            const SpaceH10(),
            Wrap(
              spacing: 5,
              children: [
                for (var keyword in resource.keyword)
                  Chip(
                    label: Text(keyword),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
