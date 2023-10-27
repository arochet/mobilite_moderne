import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:flutter/material.dart';

class DisplayTitle extends StatelessWidget {
  final String title;
  const DisplayTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: AutoSizeText(title,
          maxLines: 2, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black)),
    );
  }
}
