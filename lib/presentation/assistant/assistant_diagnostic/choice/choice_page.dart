import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/assistant/choice.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_bar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
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
        appBar: buildAppBarAssistance(context, MediaQuery.of(context).size.height * 0.4, true),
        child: AppAsync(
          ref.watch(oneChoiceProvider(choice)),
          builder: (data) => data!.fold(
            (error) => Center(child: AppError(message: error.toString())),
            (ChoiceWithQuestions choiceLoaded) => _PanelChoiceView(
              choice: choiceLoaded,
              filAriane: filAriane,
            ),
          ),
        ));
  }
}

class _PanelChoiceView extends StatelessWidget {
  final String filAriane;
  final ChoiceWithQuestions choice;
  const _PanelChoiceView({Key? key, required this.choice, required this.filAriane}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: ListView(
        children: [
          //IMAGE WEB
          if (kIsWeb)
            Container(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                child: Image.asset(AppAssetsImage.assistanceDiagnostic, height: 300, fit: BoxFit.fitWidth),
              ),
            ),
          SpaceH20(),

          //Titre de la question
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: primaryColor,
                    ),
                    onTap: () => context.router.pop()),
                SpaceW10(),
                Expanded(
                  child: AutoSizeText("${choice.nom.getOrCrash().toUpperCase()}",
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
          SpaceH20(),

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

          //Carte
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Question
                    Text("${choice.question?.getOrCrash()}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal)),
                    SizedBox(height: 20),

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
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(title),
        ),
      ),
    );
  }
}
