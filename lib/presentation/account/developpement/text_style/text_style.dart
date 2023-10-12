import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';

@RoutePage()
class TextStylePage extends StatelessWidget {
  const TextStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Style de Texte',
      child: ShowComponentFile(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              SpaceH10(),
              Text("headlineLarge", style: Theme.of(context).textTheme.headlineLarge),
              SpaceH10(),
              Text("headlineMedium", style: Theme.of(context).textTheme.headlineMedium),
              SpaceH10(),
              Text("headlineSmall", style: Theme.of(context).textTheme.headlineSmall),
              SpaceH10(),
              Text("bodyLarge", style: Theme.of(context).textTheme.bodyLarge),
              SpaceH10(),
              Text("bodyMedium", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH10(),
              Text("bodySmall", style: Theme.of(context).textTheme.bodySmall),
              SpaceH10(),
              Text("titleLarge", style: Theme.of(context).textTheme.titleLarge),
              SpaceH10(),
              Text("titleMedium", style: Theme.of(context).textTheme.titleMedium),
              SpaceH10(),
              Text("titleSmall", style: Theme.of(context).textTheme.titleSmall),
              SpaceH10(),
            ]),
          ),
        ),
      ),
    );
  }
}
