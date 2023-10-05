import 'package:admin/ADMIN_PRESENTATION/core/_components/app_bar.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/app_widget.dart';
import 'package:admin/providers.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';

/// Scaffold de base de l'application qui est responsive en fonction de la taille de l'écran
class MainScaffold extends ConsumerWidget {
  const MainScaffold({Key? key, required this.child, this.title, this.color, this.displayColumn = true})
      : super(key: key);
  final Widget child;
  final String? title;
  final Color? color;
  final bool displayColumn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      if (kIsWeb && constraints.maxWidth > 600 && displayColumn) {
        return Scaffold(
          backgroundColor: color,
          body: Row(
            children: [
              Container(
                  width: 300,
                  color: colorpanel(800),
                  child: const Column(
                    children: [
                      SpaceH10(),
                      _Title(),
                      SpaceH10(),
                      NavLinkRetour(),
                    ],
                  )),
              Expanded(child: child),
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: buildAppBar(context, ref, title),
          backgroundColor: color,
          body: child,
        );
      }
    });
  }
}

class NavLinkRetour extends StatelessWidget {
  const NavLinkRetour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: ListTile(
          leading: const Icon(Icons.backspace_rounded),
          title: const Text('Retour'),
          tileColor: colorpanel(900),
          hoverColor: colorpanel(700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onTap: () {
            printDev();
            context.router.pop();
          },
        ));
  }
}

class _Title extends ConsumerWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        printDev();
        context.router.replaceAll([HomeRoute()]);
        ref.read(currentPageNavProvider.notifier).state = 1;
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Text('Admin Dist\'Atelier', style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }
}
