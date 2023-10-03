import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/firebase_options.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilite_moderne/injection.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

import 'PRESENTATION/core/_utils/dev_utils.dart';
import 'config_reader.dart';

Future<void> mainCommon(Environment env) async {
  configurationInjection(env.name);
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
      name: 'mobilite-moderne',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Sert à afficher les logs en mode dev
  getIt.registerSingleton<AppLog>(AppLog());

  runApp(MainApp(env: env));
}

class MainApp extends StatelessWidget {
  final Environment env;
  const MainApp({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [environment.overrideWith((ref) => env)],
      child: AppWidget(),
    );
  }
}
