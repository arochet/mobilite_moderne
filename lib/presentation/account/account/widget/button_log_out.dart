import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonLogOut extends ConsumerWidget {
  const ButtonLogOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      child: ElevatedButton(
        onPressed: () {
          printDev();
          ref.read(authNotifierProvider.notifier).signOut();
        },
        child: Text(AppLocalizations.of(context)!.sedeconnecter),
      ),
    );
  }
}
