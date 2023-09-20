import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;
  AppError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error, size: 28),
        SizedBox(width: 10),
        Expanded(
          child: AutoSizeText(
            message,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
