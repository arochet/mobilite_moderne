import 'package:mobilite_moderne/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

@RoutePage()
class AuthInitPage extends StatelessWidget {
  const AuthInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      //Application Mobile
      return Scaffold(
        backgroundColor: colorpanel(900),
        body: SafeArea(
          child: ShowEnvironment(child: ShowComponentFile(child: PanelInit())),
        ),
      );
    } else {
      //Web
      return Scaffold(
        backgroundColor: colorpanel(900),
        body: ShowEnvironment(
          child: ShowComponentFile(
            child: Row(
              children: [
                Expanded(child: PanelInit()),
                Expanded(child: PanelConnexion()),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class PanelInit extends StatelessWidget {
  const PanelInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Mobilité Moderne", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20),
              Image(
                image: AssetImage("assets/icon/icon.png"),
                height: 120,
              ),
            ],
          ),
        ),
        if (!kIsWeb)
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Center(
                  //BOUTON COMMENCER
                  child: ElevatedButton(
                    onPressed: () => context.router.push(AuthConnexionRoute()),
                    style: Theme.of(context).extension<AppThemeExtention>()?.buttonLarge,
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context)!.commencer,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                        Expanded(child: Container(height: 30)),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ))
      ],
    );
  }
}
