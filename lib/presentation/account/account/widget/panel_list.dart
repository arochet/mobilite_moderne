import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:flutter/material.dart';

class ItemPanelList {
  final IconData? icon;
  final String title;
  final bool arrow;
  final Function() onTap;

  ItemPanelList({required this.title, this.icon, required this.onTap, this.arrow = true});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final TextButton? button;
  final String title;
  const PanelList({Key? key, required this.list, required this.title, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorpanel(900),
      child: ShowComponentFile(
        title: title,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(children: [
            ...list
                .map((ItemPanelList item) => GestureDetector(
                      onTap: item.onTap,
                      child: Container(
                        color: colorpanel(900),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            if (item.icon != null) Icon(item.icon),
                            SizedBox(width: 10),
                            Expanded(
                              child: AutoSizeText(item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.bodyMedium!),
                            ),
                            if (item.arrow) Icon(Icons.arrow_forward_ios, color: colorpanel(50), size: 15),
                          ],
                        ),
                      ),
                    ))
                .toList(),
            button ?? Container(),
          ]),
        ),
      ),
    );
  }
}
