import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widget/my_account.dart';

/// Page d'accueil
@RoutePage()
class AssistantPage extends ConsumerWidget {
  const AssistantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'assistant/assistant_page.dart',
      child: Column(
        children: [
          //Mon compte
          Row(
            children: [
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
                      onPressed: () async {
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
                        context.router.push(Assistant_visioRoute());
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
    );
  }
}
