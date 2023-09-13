import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

/// AppBar référence de l'application<br>
/// Dispose d'un bouton oeil en mode développeur pour afficher les chemins des fichiers<br>
AppBar? buildAppBar(BuildContext context, WidgetRef ref, String? title,
    {Color? color, bool displayEye = true}) {
  final env = ref.watch(environment.notifier).state.name;
  return AppBar(
    toolbarHeight: 55,
    backgroundColor: color ?? colorpanel(900),
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: colorpanel(50),
      size: 30,
    ),
    title: title != null ? Text(title, style: Theme.of(context).textTheme.titleLarge) : null,
    actions: env == Environment.dev && displayEye
        ? [
            InkWell(
              onTap: () {
                printDev();
                final notifier = ref.read(showFilePath.notifier);
                notifier.state = !ref.read(showFilePath);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.remove_red_eye, size: 25),
              ),
            ),
          ]
        : null,
  );
}
