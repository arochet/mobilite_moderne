import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/firestore_helpers.dart';

part 'resource.freezed.dart';

/// Type de ressource : document, vidéo, lien
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

enum ResourceMainCategory { mediatheque, notice_constructeur, pieces_fournisseurs }

class ResourceMainCategoryUtils {
  static ResourceMainCategory fromString(String value) {
    return ResourceMainCategory.values.firstWhere((e) => e.toString() == value);
  }
}

extension ResourceMainCategoryExtension on ResourceMainCategory {
  String get title {
    switch (this) {
      case ResourceMainCategory.mediatheque:
        return 'Médiathèque';
      case ResourceMainCategory.notice_constructeur:
        return 'Notice Constructeur';
      case ResourceMainCategory.pieces_fournisseurs:
        return 'Pièces et Fournisseurs';
    }
  }

  String get titleBar {
    switch (this) {
      case ResourceMainCategory.mediatheque:
        return 'Médiathèque';
      case ResourceMainCategory.notice_constructeur:
        return 'Notices\nconstructeur';
      case ResourceMainCategory.pieces_fournisseurs:
        return 'Pièces\nfournisseurs';
    }
  }

  String get nameFile {
    switch (this) {
      case ResourceMainCategory.mediatheque:
        return "mediatheque";
      case ResourceMainCategory.notice_constructeur:
        return "notice_constructeur";
      case ResourceMainCategory.pieces_fournisseurs:
        return "pieces_et_fournisseurs";
      default:
        return "mediatheque";
    }
  }

  /// Sert pour l'interface admin
  AppCategory get category {
    switch (this) {
      case ResourceMainCategory.mediatheque:
        return AppCategory(
            id: UniqueId.fromUniqueString('mediatheque'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/mediatheque',
            listResource: null,
            hasSubCategory: false);
      case ResourceMainCategory.notice_constructeur:
        return AppCategory(
            id: UniqueId.fromUniqueString('notice_constructeur'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/notice_constructeur',
            listResource: null,
            hasSubCategory: false);
      case ResourceMainCategory.pieces_fournisseurs:
        return AppCategory(
            id: UniqueId.fromUniqueString('pieces_et_fournisseurs'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/pieces_et_fournisseurs',
            listResource: null,
            hasSubCategory: false);
      default:
        return AppCategory(
            id: UniqueId.fromUniqueString('mediatheque'),
            nom: Nom(name),
            subcategory: null,
            path: 'category/mediatheque',
            listResource: null,
            hasSubCategory: false);
    }
  }

  /// Retourne la collection Firestore en fonction de la catégorie
  CollectionReference<Object?> getCollection(FirebaseFirestore _firestore) {
    switch (this) {
      case ResourceMainCategory.mediatheque:
        return _firestore.mediathequeCollection;
      case ResourceMainCategory.notice_constructeur:
        return _firestore.noticeConstucteurCollection;
      case ResourceMainCategory.pieces_fournisseurs:
        return _firestore.pieceFournisseurCollection;
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

    /// Nom de la ressource affiché dans la page
    required Nom nom,

    /// Type de ressource : document, vidéo, lien
    required ResourceType type,

    /// Chemin du document dans Firebase Storage
    required String documentPath,
    @deprecated required UniqueId idCategory,

    /// Liste de mot clé pour la recherche Algolia
    required List<String> keyword,

    /// Description de la ressource, sert pour le moteur de recherche Algolia
    required String description,

    /// Description pour l'affichage dans la liste des ressources
    required String shortDescription,

    /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
    required ResourceMainCategory mainCategory,
    // Nom du fichier de l'image
    required String image,

    /// Image qui est charger avec le paramètre image
    Future<Uint8List?>? imageBytes,

    /// Image URL pour le web
    Future<String>? imageUrl,
  }) = _Resource;

  String get imagePath => '${mainCategory.nameFile}/$image';

  factory Resource.empty() => Resource(
        id: UniqueId(),
        nom: Nom('-'),
        type: ResourceType.document,
        documentPath: '',
        idCategory: UniqueId(),
        keyword: [],
        description: '',
        shortDescription: '',
        image: '',
        mainCategory: ResourceMainCategory.mediatheque,
      );

  factory Resource.error(String err) => Resource(
        id: UniqueId(),
        nom: Nom('Unfound'),
        type: ResourceType.document,
        documentPath: '',
        idCategory: UniqueId(),
        keyword: [],
        description: '$err',
        shortDescription: '',
        image: '',
        mainCategory: ResourceMainCategory.mediatheque,
      );
}
