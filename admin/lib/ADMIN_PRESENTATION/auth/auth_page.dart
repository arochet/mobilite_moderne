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
import 'package:mobilite_moderne/DOMAIN/core/value_validators.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MainScaffold(
      displayColumn: false,
      title: 'DIST ATELIER ADMIN',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: _CardSignIn(),
          ),
        ),
      ),
    );
  }
}

class _CardSignIn extends ConsumerStatefulWidget {
  const _CardSignIn({Key? key}) : super(key: key);

  @override
  __CardSignInState createState() => __CardSignInState();
}

class __CardSignInState extends ConsumerState<_CardSignIn> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(child: Container()),
                // CHAMPS POUR LE MOT DE PASSE
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                  controller: _controller,
                  obscureText: true,
                ),

                SpaceH30(),

                // BOUTON DE CONNEXION
                ElevatedButton(
                  onPressed: () async {
                    if (validatePassword(_controller.text).isLeft()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Mot de passe incorrect !')));
                      return;
                    }
                    final Either<AuthFailure, Unit> response = await ref
                        .read(authRepositoryProvider)
                        .signInWithEmailAndPassword(
                            emailAdress: EmailAddress('devsuptekdigital@gmail.com'),
                            password: Password(_controller.text));

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
