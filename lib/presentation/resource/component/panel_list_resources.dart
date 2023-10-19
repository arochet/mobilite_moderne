import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

import 'resource_tile.dart';

class PanelListResources extends ConsumerWidget {
  final List<Resource> listRessources;
  const PanelListResources(this.listRessources, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'PanelListResources',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Liste des PDFs
          SpaceH10(),
          Text("Documents", style: Theme.of(context).textTheme.titleSmall),
          SpaceH5(),
          ...listRessources
              .where((element) => element.type == ResourceType.document)
              .map((Resource resource) {
            return ResourceTile(resource: resource);
          }).toList(),
          if (listRessources.where((element) => element.type == ResourceType.document).length == 0)
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Pas de documents', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),

          // Liste des vidéos
          SpaceH10(),
          Text("Vidéos", style: Theme.of(context).textTheme.titleSmall),
          SpaceH5(),
          ...listRessources
              .where((Resource resourceDoc) => resourceDoc.type == ResourceType.video)
              .map((Resource resource) {
            return ResourceTile(resource: resource);
          }).toList(),
          if (listRessources
                  .where((Resource resourceVideo) => resourceVideo.type == ResourceType.video)
                  .length ==
              0)
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Pas de vidéos', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
        ],
      ),
    );
  }
}
