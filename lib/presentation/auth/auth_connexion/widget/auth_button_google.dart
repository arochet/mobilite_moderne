import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonGoogle extends ConsumerWidget {
  const ButtonGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 350,
      child: SignInButton(
        Buttons.Google,
        text: AppLocalizations.of(context)!.connexionavecgoogle,
        onPressed: () {
          printDev();
          ref.read(signInFormNotifierProvider.notifier).signInWithGooglePressed();
        },
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
      ),
    );
  }
}
