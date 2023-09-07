import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:integration_test/integration_test.dart';

import 'account_test.dart' as accounttest;
import 'connexion_page_test.dart' as connexionpage;

Future<void> main() async {
  group('[Présentation]', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    configurationInjection(Environment.prod);

    accounttest.main();
    connexionpage.main();
  });
}

Widget buildMainWidget(Widget child) {
  return MediaQuery(data: new MediaQueryData(), child: ProviderScope(child: MaterialApp(home: child)));
}

Widget buildMainWidgetWithOption(Widget child, List<Override> option) {
  return MediaQuery(
      data: new MediaQueryData(),
      child: ProviderScope(overrides: [...option], child: MaterialApp(home: child)));
}

//////// OVERRIDE ////////
final currentUserDataOverride = FutureProvider.autoDispose<UserData?>((ref) async => UserData(
      id: UniqueId(),
      userName: Nom("MyUserName"),
      email: EmailAddress("azer@yopmail.com"),
      passwordCrypted: true,
      typeAccount: TypeAccount(TypeAccountState.email),
    ));
