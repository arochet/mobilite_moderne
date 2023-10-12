import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Legal_mentionPage extends StatelessWidget {
  const Legal_mentionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleNormal = Theme.of(context).textTheme.bodyMedium;
    final styleTitle = Theme.of(context).textTheme.titleMedium;
    return MainScaffold(
      title: 'Mentions légales',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(style: styleNormal, children: [
                TextSpan(
                    text:
                        "Nom de l'Hébergeur Adresse de l'Hébergeur Numéro de Téléphone de l'Hébergeur Adresse E-mail de l'Hébergeur",
                    style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text: "CNIL (Commission Nationale de l'Informatique et des Libertés) :",
                    style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "L'application Dist'Atelier a fait l'objet d'une déclaration auprès de la CNIL sous le numéro [Numéro de Déclaration CNIL]."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Conditions Générales d'Utilisation (CGU) :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text: "Consultez nos Conditions Générales d'Utilisation [insérer le lien vers les CGU]."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Politique de Confidentialité :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Consultez notre Politique de Confidentialité [insérer le lien vers la Politique de Confidentialité]."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Droits d'Auteur et Propriété Intellectuelle :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "L'ensemble du contenu de l'application, y compris le texte, les images, les graphiques, les logos, les boutons, les icônes, et tout autre élément, est la propriété exclusive de Dist'Atelier ou de ses concédants de licence et est protégé par les lois sur le droit d'auteur."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Cookies :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "L'application utilise des cookies pour [décrire brièvement la finalité des cookies]."),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Numéro de TVA (le cas échéant) :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Numéro de TVA : [Numéro de TVA]"),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Coordonnées de l'Autorité de Régulation :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(
                    text:
                        "Autorité de Régulation compétente Adresse de l'Autorité de Régulation Numéro de Téléphone de l'Autorité de Régulation"),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Barème des Prix (le cas échéant) :", style: styleTitle),
                TextSpan(text: "\n\n"),
                TextSpan(text: "Les tarifs applicables à nos services sont disponibles sur l'application."),
                TextSpan(text: "\n\n"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
