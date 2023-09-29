import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/assistant_diagnostic/choice.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/resource/component/resource_tile.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AnswerPage extends ConsumerWidget {
  final String filAriane;
  final ChoiceWithAnswer choice;
  const AnswerPage({Key? key, required this.choice, required this.filAriane}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: 'Assistant Diagnostic',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          //Récupère la réponse via l'id de la question
          child: AppAsync(ref.watch(oneAnswerProvider(choice)), builder: (eitherAnswer) {
            return eitherAnswer.fold(
              (l) => AppError(message: l.toString()),
              (r) => _Body(choice: r, filAriane: filAriane),
            );
          }),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String filAriane;
  final ChoiceWithAnswer choice;
  const _Body({super.key, required this.choice, required this.filAriane});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 15),

        //Fil d'ariane
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Wrap(
              children: filAriane
                  .split('/')
                  .map((e) => e.length > 1
                      ? Card(
                          margin: EdgeInsets.all(2),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("$e", style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        )
                      : Container())
                  .toList()),
        ),

        SpaceH30(),

        //Titre de la réponse
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Text("${choice.nom.getOrCrash()}", style: Theme.of(context).textTheme.titleMedium),
        ),
        //Réponse au format Texte
        Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("${choice.answer.getOrCrash()}", style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        SpaceH30(),

        //Liste des PDFs associés à la réponse
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text("Documents", style: Theme.of(context).textTheme.titleSmall),
        ),
        SpaceH10(),

        // Liste des PDFs
        ...choice.listRessources
            .where((element) => element.type == ResourceType.document)
            .map((Resource resource) {
          return ResourceTile(resource: resource);
        }).toList(),
        if (choice.listRessources.where((element) => element.type == ResourceType.document).length == 0)
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text('Pas de documents', style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),

        // Liste des vidéos
        SpaceH10(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text("Vidéos", style: Theme.of(context).textTheme.titleSmall),
        ),
        SpaceH10(),
        ...choice.listRessources
            .where((element) => element.type == ResourceType.video)
            .map((Resource resource) {
          return ResourceTile(resource: resource);
        }).toList(),
        if (choice.listRessources.where((element) => element.type == ResourceType.video).length == 0)
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text('Pas de vidéos', style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),

        SpaceH40(),
        Align(
          child: ElevatedButton(
            onPressed: () {
              context.router.popUntilRoot();
            },
            child: Text("Retour à l'accueil"),
          ),
        ),
      ],
    );
  }
}
