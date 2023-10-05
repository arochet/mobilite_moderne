import 'package:admin/ADMIN_PRESENTATION/core/_components/main_scaffold.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/show_component_file.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_core/app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:admin/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/auth/failure/auth_failure.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      displayColumn: false,
      color: colorpanel(50),
      title: 'DIST ATELIER ADMIN',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () async {
                    final Either<AuthFailure, Unit> response = await ref
                        .read(authRepositoryProvider)
                        .signInWithEmailAndPassword(
                            emailAdress: EmailAddress('devsuptekdigital@gmail.com'),
                            password: Password('qsdfqsdf'));

                    if (response.isRight()) {
                      context.router.replaceAll([HomeRoute()]);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Erreur de connexion !')));
                    }
                  },
                  child: Text('Se connecter'),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
