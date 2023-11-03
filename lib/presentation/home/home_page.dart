import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/is_connected_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/assets_image.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssetsImage.accueil),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ShowEnvironment(
            child: ShowComponentFile(
              child: IsConnected(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(maxWidth: 600),
                    child: _ColumnMenu(),
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ColumnMenu extends ConsumerWidget {
  const _ColumnMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssetsImage.logoBlanc,
          width: 150,
          height: 150,
          //package: 'mobilite_moderne',
        ),
        SizedBox(height: 20),
        Text("L’assistance digitale des réparateurs de micro-mobilité",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 50),
        SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () {
              printDev();
              ref.read(currentPageNavProvider.notifier).state = 0;
              context.router.push(AssistantRoute());
            },
            child: Text('Assistance technique'),
          ),
        ),
        SizedBox(height: 5),
        Text("Solutions innovantes pour profiter de l’expertise de nos techniciens.",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
        SpaceH20(),
        SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () {
              printDev();
              ref.read(currentPageNavProvider.notifier).state = 1;
              context.router.push(Resource_menuRoute());
            },
            child: Text('Ressources'),
          ),
        ),
        SizedBox(height: 5),
        Text("La plus grande médiathèque technique à votre disposition 24h/24.",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
        SpaceH20(),
        SizedBox(
          width: 350,
          child: ElevatedButton(
            onPressed: () {
              printDev();
              ref.read(currentPageNavProvider.notifier).state = 2;
              context.router.push(NewsListRoute());
            },
            child: Text('Actualités'),
          ),
        ),
        SizedBox(height: 5),
        Text("Nouveautés techniques pour améliorer la rentabilité de votre atelier.",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
      ],
    );
  }
}
