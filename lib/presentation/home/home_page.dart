import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Page d'accueil
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowEnvironment(
      child: ShowComponentFile(
        title: 'home/home_page.dart',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mobilité Moderne",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: colorpanel(50))),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Primary"),
                style: null,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Warning"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonWarning,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Remove"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Help"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonHelp,
              ),
              AppAsync(
                ref.watch(currentUserData),
                builder: (UserData? p0) => Text(p0?.email?.getOrCrash() ?? 'no user'),
                loading: Text('...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
