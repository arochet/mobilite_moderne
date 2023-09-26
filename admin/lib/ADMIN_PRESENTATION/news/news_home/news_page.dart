import 'package:admin/ADMIN_PRESENTATION/core/_core/admin_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:admin/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/DOMAIN/news/news_failure.dart';
import 'package:mobilite_moderne/DOMAIN/news/value_objects.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_async.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/app_error.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

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
      title: Text(news.title.getOrCrash()),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () async {
          await ref.read(newsRepositoryProvider).delete(news.id);
        },
      ),
    );
  }
}
