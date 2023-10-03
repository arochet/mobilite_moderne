import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/is_connected_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowEnvironment(
      child: ShowComponentFile(
        child: IsConnected(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Image du logo
                  Image.asset(
                    AssetsImage.logo,
                    width: 100,
                  ),
                  SizedBox(height: 70),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        printDev();
                        context.router.push(AssistantRoute());
                      },
                      child: Text('Assistant Technique'),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                      "Trouvez ici les solutions à vos problèmes: fiches techniques, vidéos, messagerie ou visio-assistance",
                      style: Theme.of(context).textTheme.bodySmall),
                  SpaceH20(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          printDev();
                          context.router.push(Resource_menuRoute());
                        },
                        child: Text('Ressources')),
                  ),
                  SizedBox(height: 5),
                  Text("Trouvez ici vos listes de fournisseurs par type de pièces et accéssoires",
                      style: Theme.of(context).textTheme.bodySmall),
                  SpaceH20(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          printDev();
                          context.router.push(NewsListRoute());
                        },
                        child: Text('Actualités')),
                  ),
                  SizedBox(height: 5),
                  Text("Les dernières actualités techniques", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
