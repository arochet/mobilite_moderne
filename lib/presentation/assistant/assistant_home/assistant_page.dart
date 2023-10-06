import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
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
      title: 'assistant/assistant_page.dart',
      child: Align(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              //Mon compte
              if (!kIsWeb)
                Row(
                  children: [
                    Expanded(child: Container()),
                    MyAccount(),
                    Expanded(child: Container()),
                  ],
                ),

              //Menu
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: kIsWeb
                              ? null
                              : () async {
                                  printDev();
                                  context.router.push(MessageListRoute());
                                },
                          child: Text("Messagerie-Assistance"),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () async {
                            printDev();
                            if (kIsWeb) {
                              final _url = 'https://toulon.mobilitemoderne.fr/smart-agenda.html';
                              if (!await launchUrl(Uri.parse(_url))) {
                                throw Exception('Could not launch $_url');
                              }
                            } else {
                              context.router.push(Assistant_visioRoute());
                            }
                          },
                          child: Text("Visio Assistance"),
                        ),
                      ),
                    ],
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
