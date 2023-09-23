import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:admin/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      color: colorpanel(50),
      title: 'DIST ATELIER ADMIN',
      child: ShowComponentFile(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final qsdf = await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
                          emailAdress: EmailAddress('azer@yopmail.com'), password: Password('azerazer'));
                      print(qsdf);
                    },
                    child: Text('Se connecter'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final qsdf = await ref.read(authRepositoryProvider).signOut();
                    },
                    child: Text('Se deconnecter'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
