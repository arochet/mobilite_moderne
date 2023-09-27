import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'resource.freezed.dart';

enum ResourceType { document, video, link }

//Extention de resourceType pour afficher le nom de l'enum
extension ResourceTypeExtension on ResourceType {
  String get name {
    switch (this) {
      case ResourceType.document:
        return 'Document';
      case ResourceType.video:
        return 'Vidéo';
      case ResourceType.link:
        return 'Lien';
      default:
        return 'Unknow';
    }
  }

  // Icon pour la resource tile
  IconData get icon {
    switch (this) {
      case ResourceType.document:
        return Icons.picture_as_pdf;
      case ResourceType.video:
        return Icons.video_collection;
      case ResourceType.link:
        return Icons.link;
      default:
        return Icons.error;
    }
  }
}

/// Une ressource est un document, une vidéo, un lien, etc. qui est lié à une catégorie
/// On peut le retrouver via recherche par mot clé ou dans la description
@freezed
abstract class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    required UniqueId id,
    required Nom nom,
    required ResourceType type,
    required String documentPath,
    required UniqueId idCategory,
    required List<String> keyword,
    required String description,
  }) = _Resource;

  factory Resource.empty() => Resource(
        id: UniqueId(),
        nom: Nom('-'),
        type: ResourceType.document,
        documentPath: '',
        idCategory: UniqueId(),
        keyword: [],
        description: '',
      );

  factory Resource.error(String err) => Resource(
        id: UniqueId(),
        nom: Nom('Unfound'),
        type: ResourceType.document,
        documentPath: '',
        idCategory: UniqueId(),
        keyword: [],
        description: '$err',
      );
}
