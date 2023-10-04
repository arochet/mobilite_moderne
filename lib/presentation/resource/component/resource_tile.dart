import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource_failure.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/snackbar.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/router.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:mobilite_moderne/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceTile extends StatelessWidget {
  ResourceTile({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    if (resource.type == ResourceType.document) {
      return _DocumentTile(resource: resource);
    } else if (resource.type == ResourceType.video) {
      return _VideoTile(resource: resource);
    } else {
      return ListTile(title: Text('Resource Type Unfound ${resource.type}'));
    }
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
    return ListTile(
      leading: Icon(resource.type.icon),
      title: Text(resource.nom.getOrCrash()),
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
      trailing: Icon(Icons.arrow_forward_ios),
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
    return ListTile(
      leading: Icon(Icons.video_library),
      title: Text(resource.nom.getOrCrash()),
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
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
