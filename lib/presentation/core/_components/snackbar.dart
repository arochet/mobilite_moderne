import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
