import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Account extends ConsumerWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qsdf = ref.watch(currentUser).value;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Account: ${qsdf?.id}", style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
