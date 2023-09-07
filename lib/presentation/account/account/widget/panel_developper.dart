import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';

class PanelDevelopper extends StatelessWidget {
  const PanelDevelopper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelDevelopper',
      list: [
        ItemPanelList(
          title: 'Components',
          icon: Icons.view_day,
          onTap: () {
            printDev();
            context.router.push(ComponentsRoute());
          },
        ),
        ItemPanelList(
          title: 'Couleurs',
          icon: Icons.colorize,
          onTap: () {
            printDev();
            context.router.push(ColorsRoute());
          },
        ),
        ItemPanelList(
          title: 'Boutons',
          icon: Icons.smart_button,
          onTap: () {
            printDev();
            context.router.push(ButtonsRoute());
          },
        ),
        ItemPanelList(
          title: 'Style de texte',
          icon: Icons.font_download,
          onTap: () {
            printDev();
            context.router.push(TextStyleRoute());
          },
        ),
        ItemPanelList(
          title: 'Utils',
          icon: Icons.settings,
          onTap: () {
            printDev();
            context.router.push(UtilsRoute());
          },
        ),
      ],
    );
  }
}
