import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: colorpanel(50),
        )),
        SizedBox(width: 10),
        Text("OR", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(width: 10),
        Expanded(child: Divider(color: colorpanel(50))),
      ]),
    );
  }
}
