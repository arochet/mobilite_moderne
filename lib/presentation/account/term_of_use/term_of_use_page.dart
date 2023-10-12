import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

@RoutePage()
class Term_of_usePage extends StatelessWidget {
  const Term_of_usePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleNormal = Theme.of(context).textTheme.bodyMedium;
    final styleTitle = Theme.of(context).textTheme.titleMedium;
    return MainScaffold(
      title: 'Conditions Générales de Vente (CGV) pour l\'Application Dist\'Atelier',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(style: styleNormal, children: [
                TextSpan(text: "\n\n"),
                TextSpan(text: "1. Acceptation des Conditions Générales de Vente", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "En utilisant l'application Dist'Atelier, vous acceptez sans réserve les présentes Conditions Générales de Vente."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "2. Utilisation de l'Application", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. L'accès à l'application est conditionné par votre respect des présentes CGV et de toute autre politique applicable."),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "b. Vous acceptez de n'utiliser l'application qu'à des fins légales et conformément à toutes les lois et réglementations applicables."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "3. Compte Utilisateur", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. Certains services de l'application peuvent nécessiter la création d'un compte utilisateur. Vous êtes responsable de la confidentialité de vos informations d'identification et de toutes les activités sur votre compte."),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "b. Vous acceptez de fournir des informations exactes, complètes et à jour lors de la création de votre compte."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "4. Propriété Intellectuelle", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. Tous les droits de propriété intellectuelle relatifs à l'application et à son contenu sont la propriété de Dist'Atelier ou de ses concédants de licence."),
                TextSpan(
                    text:
                        "b. Vous vous engagez à ne pas copier, reproduire, modifier, distribuer ou exploiter de quelque manière que ce soit le contenu de l'application sans autorisation écrite préalable."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "5. Paiement", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. Certains services de l'application peuvent être soumis à des frais. Les conditions de paiement sont spécifiées dans la section appropriée de l'application."),
                TextSpan(
                    text:
                        "b. Les paiements sont effectués conformément aux modalités de paiement spécifiées lors de la commande."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "6. Responsabilité", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "a. L'utilisation de l'application est à vos risques et périls. L'application est fournie \"telle quelle\" sans garantie d'aucune sorte."),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "b. Dist'Atelier ne saurait être tenu responsable des dommages directs, indirects, spéciaux ou consécutifs résultant de l'utilisation ou de l'incapacité à utiliser l'application."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "7. Modification des Conditions Générales de Vente", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Dist'Atelier se réserve le droit de modifier les présentes CGV à tout moment. Les modifications seront publiées sur l'application et seront effectives dès la publication."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "8. Loi Applicable et Juridiction", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Les présentes CGV sont régies par les lois de France. Tout litige découlant des présentes CGV sera soumis à la juridiction exclusive des tribunaux de Toulon."),
                TextSpan(text: "\n\n"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
