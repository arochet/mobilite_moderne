import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:admin/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/dialogs.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';

@RoutePage()
class AdminNewsPage extends ConsumerWidget {
  const AdminNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // Liste des articles
            Expanded(
              child: AppAsync(
                ref.watch(allNewsProvider),
                builder: (data) => data!.fold(
                    (error) => AppError(message: error.toString()),
                    (listNews) => ListView(children: [
                          ...listNews.map<Widget>((News newsObj) => _TileNewsView(newsObj)).toList()
                        ])),
              ),
            ),

            // Bouton ajouter un article
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  context.router.push(NewsAddRoute());
                },
                child: Text('Ajouter un article'),
              ),
            ),
            SpaceH20(),
          ],
        ),
      ),
    );
  }
}

class _TileNewsView extends ConsumerWidget {
  final News news;
  const _TileNewsView(this.news, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(news.title.getOrCrash(), style: Theme.of(context).textTheme.titleSmall),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () async {
          final canRemove = await showDialogQuestion(
              context, 'Supprimer', 'Voulez-vous supprimer cet article ?',
              isDanger: true, txtBtnValidate: 'Supprimer');

          if (canRemove == true) {
            await ref.read(newsRepositoryProvider).delete(news.id);
          }
        },
      ),
    );
  }
}
