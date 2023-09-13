import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    printDev();
                  },
                  child: Text('Assistant Technique'),
                  //style: Theme.of(context).extension<AppThemeExtention>()?.buttonLarge.copyWith(),
                ),
              ),
              Text(
                  "Trouvez ici les solutions à vos problèmes: fiches techniques, vidéos, messagerie ou visio-assistance",
                  style: Theme.of(context).textTheme.bodySmall),
              SpaceH20(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      printDev();
                    },
                    child: Text('Ressources')),
              ),
              Text("Trouvez ici vos listes de fournisseurs par type de pièces et accéssoires",
                  style: Theme.of(context).textTheme.bodySmall),
              SpaceH20(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      printDev();
                    },
                    child: Text('Actualités')),
              ),
              Text("Les dernières actualités techniques", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        )),
      ),
    );
  }
}
