import 'package:auto_route/auto_route.dart';
import 'package:mobilite_moderne/DOMAIN/auth/user_data.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_loading.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/is_connected_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ComponentsPage extends ConsumerWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: 'Components',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Text("Base PDF", style: Theme.of(context).textTheme.bodyMedium),
              Text("Sert à créer un PDF", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH10(),
              Text("Constrained Box Max Width", style: Theme.of(context).textTheme.bodyMedium),
              ContrainedBoxMaxWidth(
                  child: Container(
                color: Colors.red,
                height: 10,
              )),
              SpaceH10(),
              Text("Card", style: Theme.of(context).textTheme.bodyMedium),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Card", style: Theme.of(context).textTheme.bodyMedium),
                ),
              )),
              Text("AppLoading", style: Theme.of(context).textTheme.bodyMedium),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppLoading(),
              )),
              Text("AppError", style: Theme.of(context).textTheme.bodyMedium),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppError(message: 'Error'),
              )),
              SpaceH10(),
              Text("AppAsync", style: Theme.of(context).textTheme.bodyMedium),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppAsync(
                    ref.watch(currentUserData),
                    builder: (UserData? p0) => Text('AppAsync Value ${p0?.email?.getOrCrash()}'),
                    loading: Text('...'),
                  ),
                ),
              ),
              SpaceH10(),
              Text("Is Connected Widget", style: Theme.of(context).textTheme.bodyMedium),
              Container(
                height: 100,
                child: IsConnected(
                  child: Center(
                    child: Text("Mode avion pour tester \n/!\ Ne pas mettre dans un column ou ListView ",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ),
              SpaceH10(),
              Text("Main Scaffold", style: Theme.of(context).textTheme.bodyMedium),
              _ContainerTxt("MainScaffold"),
              SpaceH10(),
              Text("Show Environnement Widget", style: Theme.of(context).textTheme.bodyMedium),
              Container(
                  height: 100,
                  color: Colors.red,
                  child: ShowEnvironment(child: _ContainerTxt('Show Environment Widget'))),
              SpaceH10(),
              Text("Spacing", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH10(),
              Text("SpaceH10", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH10(),
              Text("SpaceH20", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH20(),
              Text("SpaceH30", style: Theme.of(context).textTheme.bodyMedium),
              SpaceH30(),
              Text("Show Dialog", style: Theme.of(context).textTheme.bodyMedium),
              //SHOW DIALOG
              ElevatedButton(
                onPressed: () {
                  printDev();
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Basic dialog title'),
                        content: const Text('A dialog is a type of modal window that\n'
                            'appears in front of app content to\n'
                            'provide critical information, or prompt\n'
                            'for a decision to be made.'),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Disable'),
                            onPressed: () {
                              printDev();
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Enable'),
                            onPressed: () {
                              printDev();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("showDialog()"),
              ),
              Text("Show Modal Bottom Sheet", style: Theme.of(context).textTheme.bodyMedium),
              ElevatedButton(
                onPressed: () {
                  printDev();
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text("showModalBottomSheet()"),
              ),
              Text("----", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerTxt extends StatelessWidget {
  String titre;
  _ContainerTxt(
    this.titre, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Text(titre, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
