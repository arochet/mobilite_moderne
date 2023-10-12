// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

@RoutePage()
class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.nomprojet,
      child: ShowComponentFile(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Text("PRESENTATION/core/_core/theme_colors", style: Theme.of(context).textTheme.titleSmall),
                SpaceH20(),
                _DisplayColor("colorpanel(900)", colorpanel(900) ?? Colors.pink),
                _DisplayColor("colorpanel(800)", colorpanel(800) ?? Colors.pink),
                _DisplayColor("colorpanel(700)", colorpanel(700) ?? Colors.pink),
                _DisplayColor("colorpanel(600)", colorpanel(600) ?? Colors.pink),
                _DisplayColor("colorpanel(500)", colorpanel(500) ?? Colors.pink),
                _DisplayColor("colorpanel(400)", colorpanel(400) ?? Colors.pink),
                _DisplayColor("colorpanel(300)", colorpanel(300) ?? Colors.pink),
                _DisplayColor("colorpanel(200)", colorpanel(200) ?? Colors.pink),
                _DisplayColor("colorpanel(100)", colorpanel(100) ?? Colors.pink),
                _DisplayColor("colorpanel(50)", colorpanel(50) ?? Colors.pink),
                _DisplayColor("Theme.of(context).primaryColor", Theme.of(context).primaryColor),
              ],
            )),
      ),
    );
  }
}

@immutable
class _DisplayColor extends StatelessWidget {
  String title;
  Color color;
  _DisplayColor(
    this.title,
    this.color, {
    Key? key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          color: color,
          child: Center(
              child:
                  Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black))),
        ),
        SpaceH10(),
      ],
    );
  }
}
