import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/assistant/choice.dart';
import 'package:mobilite_moderne/DOMAIN/assistant/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/is_connected_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/is_suscribed.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widget/my_account.dart';

/// Page d'accueil
@RoutePage()
class AssistantPage extends ConsumerWidget {
  const AssistantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'assistant/assistant_home/assistant_page.dart',
      child: IsSuscribed(
        child: IsConnected(
          child: Column(
            children: [
              //IMAGE WEB
              if (kIsWeb)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    child: Image.asset(AppAssetsImage.assistance, height: 300, fit: BoxFit.fitWidth),
                  ),
                ),
              Expanded(
                child: Align(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Column(
                      children: [
                        //Mon compte
                        SpaceH30(),
                        Text("ASSISTANCE",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26)),
                        Expanded(child: Container()),

                        //Menu
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // BOUTON ASSISTANT DIAGNOSTIC
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ElevatedButton(
                                  onPressed: () {
                                    printDev();
                                    context.router.push(ChoiceRoute(
                                        filAriane: "",
                                        choice: ChoiceWithQuestions(
                                          id: UniqueId.fromUniqueString('votredemandeconcerne'),
                                          nom: Nom("votredemandeconcerne"),
                                          path: 'choice/votredemandeconcerne',
                                          question: Question("votredemandeconcerne"),
                                          choiceQuestion: null,
                                          choiceAnswer: null,
                                        )));
                                  },
                                  child: Text("Assistant Diagnostic"),
                                ),
                              ),
                              SizedBox(height: 10),

                              // BOUTON MESSAGERIE
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    printDev();
                                    context.router.push(MessageListRoute());
                                  },
                                  child: Text("Messagerie-assistance"),
                                ),
                              ),
                              SizedBox(height: 10),

                              // BOUTON VISIO ASSISTANCE
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    printDev();
                                    if (kIsWeb) {
                                      final _url = 'https://www.smartagenda.fr/pro/dist-atelier/rendez-vous/';
                                      if (!await launchUrl(Uri.parse(_url))) {
                                        throw Exception('Could not launch $_url');
                                      }
                                    } else {
                                      context.router.push(Assistant_visioRoute());
                                    }
                                  },
                                  child: Text("Visio-assistance"),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SpaceH40(),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
