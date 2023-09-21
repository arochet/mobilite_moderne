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
        child: ShowComponentFile(
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
              )),
        ));
  }
}

class _PanelChoiceView extends StatelessWidget {
  final String filAriane;
  final ChoiceWithQuestions choice;
  const _PanelChoiceView({Key? key, required this.choice, required this.filAriane}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(filAriane, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(child: Container()),
        Center(child: Text("${choice.nom.getOrCrash()}", style: Theme.of(context).textTheme.bodyLarge)),
        SpaceH20(),
        Card(
          color: colorpanel(900),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Question
                  Text("${choice.question?.getOrCrash()}", style: Theme.of(context).textTheme.titleMedium),
                  Divider(),

                  //Réponses menant à d'autres questions
                  ...choice.choiceQuestion
                          ?.map((ChoiceWithQuestions choice) => _TileChoice(
                                title: choice.nom.getOrCrash(),
                                onTap: () => context.router.push(ChoiceRoute(
                                    choice: choice, filAriane: '$filAriane/${choice.nom.getOrCrash()}')),
                              ))
                          .toList() ??
                      [],

                  //Réponses menant à des documents
                  ...choice.choiceAnswer
                          ?.map((ChoiceWithAnswer choice) => _TileChoice(
                                title: choice.nom.getOrCrash(),
                                onTap: () => context.router.push(AnswerRoute(
                                    choice: choice, filAriane: '$filAriane/${choice.nom.getOrCrash()}')),
                              ))
                          .toList() ??
                      [],
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 80),
        Expanded(child: Container()),
      ],
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