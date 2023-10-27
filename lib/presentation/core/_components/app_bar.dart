import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
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

PreferredSizeWidget buildAppBarAssistance(BuildContext context, double sizeHeight,
    [bool isAssitant = false]) {
  if (kIsWeb)
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Container(),
    );
  return PreferredSize(
      preferredSize: Size.fromHeight(sizeHeight), // here the desired height
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: sizeHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(AppAssetsImage.assistanceDiagnostic)),
        ),
        child: Column(
          children: [
            SpaceH40(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
                ),
                Text("Dist'Atelier",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
              ],
            ),
          ],
        ),
      ));
}

PreferredSizeWidget buildAppBarEmpty(BuildContext context, [Color? color]) {
  final backgroundColor = color ?? Colors.black;
  return AppBar(
    elevation: 0,
    toolbarHeight: 0,
    backgroundColor: backgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness:
          backgroundColor == Colors.black ? Brightness.dark : Brightness.light, // For iOS (dark icons)
    ),
  );
}
