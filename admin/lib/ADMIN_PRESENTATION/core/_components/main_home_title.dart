import 'package:flutter/material.dart';

class MainHomeTitle extends StatelessWidget {
  const MainHomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Center(
        child: Text('Interface administrateur', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
