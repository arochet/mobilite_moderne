import 'widget/news_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NewsAddPage extends StatelessWidget {
  const NewsAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'NewsAdd',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: NewsFormProvider(),
        ),
      ),
    );
  }
}
