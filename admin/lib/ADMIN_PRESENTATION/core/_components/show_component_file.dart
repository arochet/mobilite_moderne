import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ce component sert a afficher en mode développeur le chemin de la page en cour ou le nom du widget
/// Cela permet de s'y retrouver plus rapidement dans le projet
class ShowComponentFile extends ConsumerWidget {
  final Widget child;
  final String? title;
  const ShowComponentFile({required this.child, this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool displayPath = ref.watch(showFilePath);
    final Color color = Color(0xffff5470);

    if (displayPath) {
      return Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1),
              ),
              child: child),
          Center(
              heightFactor: 1,
              child: Container(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(title != null ? '$title' : '${ModalRoute.of(context)?.settings.name}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black)),
                ),
              )),
        ],
      );
    }

    return child;
  }
}
