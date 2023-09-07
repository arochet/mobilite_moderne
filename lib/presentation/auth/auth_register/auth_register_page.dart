import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/PRESENTATION/auth/auth_register/widget/auth_register_form.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.sinscrire,
      child: ShowComponentFile(
        child: FormRegisterProvide(),
      ),
    );
  }
}
