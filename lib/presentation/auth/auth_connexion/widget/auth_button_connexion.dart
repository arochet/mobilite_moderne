import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonConnexion extends ConsumerWidget {
  const ButtonConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          printDev();
          ref.read(signInFormNotifierProvider.notifier).signInWithEmailAndPasswordPressed();
        },
        style: Theme.of(context).extension<AppThemeExtention>()?.buttonLarge,
        child: Text(AppLocalizations.of(context)!.seconnecter),
      ),
    );
  }
}
