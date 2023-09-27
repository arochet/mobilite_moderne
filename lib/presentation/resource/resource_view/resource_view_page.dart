import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/component/resource_tile.dart';

@RoutePage()
class Resource_viewPage extends StatelessWidget {
  final AppCategory category;
  const Resource_viewPage(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Ressources de ${category.nom.getOrCrash()}',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: category.listResource != null && category.listResource!.isNotEmpty
              ? ListView.separated(
                  itemCount: category.listResource!.length,
                  itemBuilder: (context, index) {
                    return ResourceTile(resource: category.listResource![index]);
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
              : Center(child: Text("Aucun document disponible pour cette catégorie")),
        ),
      ),
    );
  }
}
