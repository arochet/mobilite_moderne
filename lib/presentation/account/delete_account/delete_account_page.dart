import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Delete_accountPage extends StatelessWidget {
  const Delete_accountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Delete_account',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Supprimer mon compte'),
                SpaceH20(),
                Text(
                    'Afin de supprimer votre compte, veuillez vous rendre sur la page compte de l\'application et cliquer sur le bouton "supprimer le compte".'),
                SpaceH20(),
                Text(
                    'Lorsque vous supprimez votre compte : nous supprimons toutes les données vous concernant : votre nom, adresse email et mot de passe . Aucune des ces données ne sera conservée.'),
                SpaceH20(),
              ],
            ),
          ))),
        ),
      ),
    );
  }
}
