import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:admin/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
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
        child: AppAsync(
          ref.watch(allNewsProvider),
          builder: (data) => data!.fold(
              (error) => AppError(message: error.toString()),
              (listNews) => ListView(
                  children: [...listNews.map<Widget>((News newsObj) => _TileNewsView(newsObj)).toList()])),
        ),
      ),
    );
  }
}

class _TileNewsView extends StatelessWidget {
  final News news;
  const _TileNewsView(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(news.title.getOrCrash()),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          //await context.read(newsRepositoryProvider).delete(news);
        },
      ),
    );
  }
}
