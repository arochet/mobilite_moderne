import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/_components/image_from_storage.dart';

class ResourceTile extends StatelessWidget {
  ResourceTile({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    late Widget tile;
    if (resource.type == ResourceType.document) {
      tile = _DocumentTile(resource: resource);
    } else if (resource.type == ResourceType.video) {
      tile = _VideoTile(resource: resource);
    } else {
      tile = ListTile(title: Text('Resource Type Unfound ${resource.type}'));
    }

    return tile;
  }
}

class _DocumentTile extends ConsumerWidget {
  const _DocumentTile({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: '_DocumentTile',
      child: InkWell(
        onTap: () async {
          printDev();
          //Open PDF
          final Either<ResourceFailure, String> doc =
              await ref.watch(resourceRepositoryProvider).getDocumentURL(resource.documentPath);
          doc.fold((l) => showSnackBar(context, l.message), (String result) {
            String url = result;
            if (kIsWeb) {
              _launchUrl(url);
            } else {
              context.router.push(ResourcePdfViewerRoute(resource: resource));
            }
          });
        },
        child: _CardTile(resource: resource),
      ),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}

class _VideoTile extends ConsumerWidget {
  const _VideoTile({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: '_VideoTile',
      child: InkWell(
        onTap: () async {
          //Open Vidéo
          printDev();
          final Either<ResourceFailure, String> doc =
              await ref.watch(resourceRepositoryProvider).getDocumentURL(resource.documentPath);
          doc.fold((l) => showSnackBar(context, l.message), (String result) {
            if (kIsWeb) {
              _launchUrl(result);
            } else {
              context.router.push(Resource_videoplayerRoute(resource: resource));
            }
          });
        },
        child: _CardTile(resource: resource),
      ),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      //leading: Icon(resource.type.icon),
      child: Container(
        height: 110,
        child: Row(
          children: [
            Container(
              width: 100,
              child: ImageFromStorage(
                height: 110,
                url: resource.imageUrl,
                bytes: resource.imageBytes,
              ),
            ),
            SpaceW10(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceH10(),
                  AutoSizeText(resource.mainCategory.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: primaryColor)),
                  SpaceH5(),
                  AutoSizeText(
                    resource.nom.getOrCrash(),
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SpaceH5(),
                  AutoSizeText(
                    resource.shortDescription,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SpaceH10(),
                ],
              ),
            ),
            SpaceW10(),
          ],
        ),
      ),
    );
  }
}
