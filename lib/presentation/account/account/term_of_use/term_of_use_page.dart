import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class Term_of_usePage extends StatelessWidget {
  const Term_of_usePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Condition Générale d\'Utilisation',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: ListView(children: [
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam"),
          ]),
        ),
      ),
    );
  }
}