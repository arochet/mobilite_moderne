import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_connexion/widget/auth_connexion_form.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:flutter/material.dart';
import 'widget/auth_button_connexion.dart';
import 'widget/auth_no_account_link.dart';

@RoutePage()
class AuthConnexionPage extends StatelessWidget {
  const AuthConnexionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: SafeArea(
        child: ShowComponentFile(child: PanelConnexion()),
      ),
    );
  }
}

class PanelConnexion extends StatelessWidget {
  const PanelConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(builder: (context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  maxWidth: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 28),
                  child: Center(
                    child: Column(
                      children: [
                        //FORM CONNEXION
                        FormConnexionProvider(),
                        //BOUTON SE CONNECTER
                        ButtonConnexion(),
                        const SpaceH40(),
                        /* //DIVIDER OR
                        DividerOR(),
                        const SpaceH10(),
                        //BUTTON GOOGLE
                        ButtonGoogle(),
                        const SpaceH10(), */
                        //BUTTON FACEBOOK
                        //if (!kIsWeb) ButtonFacebook(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        NoAccountLink(),
        SizedBox(height: 30),
      ],
    );
  }
}
