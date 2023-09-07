import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/injection.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

final showPrintDEV = StateProvider<bool>((ref) => false);
final showWidgetRefresh = StateProvider<bool>((ref) => false);

class ShowEnvironment extends ConsumerWidget {
  final Widget child;
  const ShowEnvironment({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environment.notifier).state.name;
    final bool showFile = ref.watch(showFilePath);
    String txtEnv = "";
    if (env == Environment.dev)
      txtEnv = "[DEV]";
    else if (env == Environment.test) txtEnv = "Environnent de test";

    return Column(
      children: [
        if (env != Environment.prod)
          Container(
            color: Colors.grey,
            height: 30,
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(txtEnv, style: Theme.of(context).textTheme.titleSmall),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    onPressed: () {
                      printDev();
                    },
                    child: Text("Raccourcis"),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Icon(Icons.refresh,
                      color:
                          ref.watch(showWidgetRefresh) ? Colors.white : Color.fromARGB(255, 217, 216, 216)),
                  onTap: () {
                    //PrintDEV
                    ref.read(showWidgetRefresh.notifier).state = !ref.read(showWidgetRefresh);
                    debugRepaintRainbowEnabled =
                        ref.read(showWidgetRefresh); //Affiche le rafraichissement des widgets
                    //RepaintBoundary pour éviter que tout se rafraîchis tout le temps
                  },
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Icon(Icons.list,
                      color: ref.watch(showPrintDEV) ? Colors.white : Color.fromARGB(255, 217, 216, 216)),
                  onTap: () {
                    //PrintDEV
                    getIt<AppLog>().can = !getIt<AppLog>().can;
                    ref.read(showPrintDEV.notifier).state = getIt<AppLog>().can;
                  },
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Icon(Icons.remove_red_eye,
                      color: showFile ? Colors.white : Color.fromARGB(255, 217, 216, 216)),
                  onTap: () {
                    //File Path Notifier
                    final notifier = ref.read(showFilePath.notifier);
                    notifier.state = !ref.read(showFilePath);
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
