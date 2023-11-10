import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';

@RoutePage()
class Subscription_errorPage extends StatelessWidget {
  const Subscription_errorPage({Key? key}) : super(key: key);

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
                'Une erreur s\'est produite !',
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
