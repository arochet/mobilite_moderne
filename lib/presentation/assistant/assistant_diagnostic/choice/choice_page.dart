import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ChoicePage extends ConsumerWidget {
  final String filAriane;
  final ChoiceWithQuestions choice;
  const ChoicePage({
    Key? key,
    required this.choice,
    required this.filAriane,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        color: colorpanel(800),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppAsync(
              ref.watch(oneChoiceProvider(choice)),
              builder: (data) => data!.fold(
                (error) => Center(child: AppError(message: error.toString())),
                (ChoiceWithQuestions choiceLoaded) => _PanelChoiceView(
                  choice: choiceLoaded,
                  filAriane: filAriane,
                ),
              ),
            )));
  }
}

class _PanelChoiceView extends StatelessWidget {
  final String filAriane;
  final ChoiceWithQuestions choice;
  const _PanelChoiceView({Key? key, required this.choice, required this.filAriane}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Fil d'ariane
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Wrap(
                children: filAriane
                    .split('/')
                    .map((e) => e.length > 1
                        ? Card(
                            color: colorpanel(900),
                            margin: EdgeInsets.all(2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                              child: Text("$e", style: Theme.of(context).textTheme.bodyMedium),
                            ),
                          )
                        : Container())
                    .toList()),
          ),
          Expanded(child: Container()),

          //Titre de la question
          Center(child: Text("${choice.nom.getOrCrash()}", style: Theme.of(context).textTheme.titleMedium)),
          SpaceH20(),

          //Carte
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Card(
                color: colorpanel(900),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Question
                        Text("${choice.question?.getOrCrash()}",
                            style: Theme.of(context).textTheme.titleMedium),
                        Divider(),

                        //Réponses menant à d'autres questions
                        ...choice.choiceQuestion
                                ?.map((ChoiceWithQuestions choice) => _TileChoice(
                                      title: choice.nom.getOrCrash(),
                                      onTap: () => context.router.push(ChoiceRoute(
                                          choice: choice,
                                          filAriane: '$filAriane/${choice.nom.getOrCrash()}')),
                                    ))
                                .toList() ??
                            [],

                        //Réponses menant à des documents
                        ...choice.choiceAnswer
                                ?.map((ChoiceWithAnswer choice) => _TileChoice(
                                      title: choice.nom.getOrCrash(),
                                      onTap: () => context.router.push(AnswerRoute(
                                          choice: choice,
                                          filAriane: '$filAriane/${choice.nom.getOrCrash()}')),
                                    ))
                                .toList() ??
                            [],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SpaceH20(),
          Align(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Retour"),
            ),
          ),
          SizedBox(height: 80),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _TileChoice extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  _TileChoice({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: onTap,
    );
  }
}
