import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Privacy_policyPage extends StatelessWidget {
  const Privacy_policyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleNormal = Theme.of(context).textTheme.bodyMedium;
    final styleTitle = Theme.of(context).textTheme.titleMedium;
    return MainScaffold(
      title: 'Politique de confidentialité',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(style: styleNormal, children: [
                TextSpan(text: "Dernière mise à jour : 6 octobre 2023", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Bienvenue sur l'application mobile Dist'Atelier. Cette Politique de Confidentialité a pour but de vous informer sur la manière dont nous collectons, utilisons, partageons et protégeons vos données personnelles lorsque vous utilisez notre Application."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "1. Collecte des Informations", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. Informations Fournies par l'Utilisateur : Lors de l'utilisation de l'Application, certaines informations peuvent être collectées, y compris, mais sans s'y limiter, votre nom, votre adresse e-mail, votre numéro de téléphone, et d'autres informations nécessaires à l'utilisation des fonctionnalités de l'Application."),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "b. Données Collectées Automatiquement : Nous pouvons collecter des informations automatiquement à l'aide de technologies telles que les cookies, les balises web et les technologies similaires. Ces informations peuvent inclure des données sur l'appareil, l'adresse IP, le type de navigateur, les pages consultées, etc."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "2. Utilisation des Informations", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. Les informations collectées peuvent être utilisées pour fournir, personnaliser et améliorer nos services, ainsi que pour vous envoyer des communications liées à l'Application."),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "b. Nous ne partageons pas vos informations personnelles avec des tiers, sauf dans les cas autorisés par la loi ou avec votre consentement explicite."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "3. Sécurité des Informations", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Nous mettons en place des mesures de sécurité raisonnables pour protéger vos informations contre tout accès non autorisé ou toute divulgation non autorisée."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "4. Accès et Contrôle de Vos Informations", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Vous avez le droit d'accéder, de corriger ou de supprimer vos informations personnelles. Pour exercer ces droits, veuillez nous contacter à contact@distatelier.fr"),
                TextSpan(text: "\n\n"),
                TextSpan(text: "5. Modifications de la Politique de Confidentialité", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Nous nous réservons le droit de modifier cette Politique de Confidentialité à tout moment. Toute modification sera publiée dans l'Application, et la date de la dernière mise à jour sera modifiée en conséquence."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "6. Consentement", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "En utilisant l'Application, vous consentez à la collecte et à l'utilisation de vos informations conformément à cette Politique de Confidentialité."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "7. Contact", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Si vous avez des questions ou des préoccupations concernant cette Politique de Confidentialité, veuillez nous contacter à contact@distatelier.fr"),
                TextSpan(text: "\n\n"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
