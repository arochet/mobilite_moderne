import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Subscription_succesPage extends StatelessWidget {
  const Subscription_succesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Subscription_succes',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Vous êtes bien abonné chez Dist Atelier !',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceAll([HomeRoute()]);
                },
                child: Text("Retour à l'accueil"),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
