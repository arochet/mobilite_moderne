import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_bar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_main_navigation/side_bar_navigation.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/providers.dart';

/// Scaffold de base de l'application qui est responsive en fonction de la taille de l'écran
class MainScaffold extends ConsumerWidget {
  const MainScaffold(
      {Key? key, required this.child, this.title, this.color, this.appBar, this.hasSidebar = true})
      : super(key: key);
  final Widget child;
  final String? title;
  final Color? color;
  final PreferredSizeWidget? appBar;
  final bool hasSidebar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      if (kIsWeb && constraints.maxWidth > 600)
        return Scaffold(
          backgroundColor: color,
          body: Row(
            children: [
              if (hasSidebar)
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SpaceH20(),
                        _Title(),
                        const SpaceH30(),
                        NavLinkRetour(),
                      ],
                    )),
              Expanded(child: child),
            ],
          ),
        );
      else
        return Scaffold(
          appBar: appBar ?? buildAppBar(context, ref, title, color: color),
          backgroundColor: color,
          body: child,
        );
    });
  }
}

class NavLinkRetour extends StatelessWidget {
  const NavLinkRetour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
      child: ElevatedButton.icon(
        onPressed: () {
          printDev();
          context.router.pop();
        },
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text("Retour"),
        ),
        icon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Icon(Icons.arrow_back_ios),
        ),
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return primaryColor;
              if (states.contains(MaterialState.hovered)) return primaryColor;
            },
          ),
        ),
      ),
    );
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
        context.router.replaceAll([AssistantRoute()]);
        ref.read(currentPageNavProvider.notifier).state = 1;
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Image.asset(
            AppAssetsImage.logo,
            height: 60,
            //package: 'mobilite_moderne',
          ),
        ),
      ),
    );
  }
}
