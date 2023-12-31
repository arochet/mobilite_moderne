import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/INFRASTRUCTURE/core/load_image.dart';
part 'resource_dtos.freezed.dart';
part 'resource_dtos.g.dart';

@freezed
abstract class ResourceDTO implements _$ResourceDTO {
  const ResourceDTO._();

  const factory ResourceDTO({
    @JsonKey(ignore: true) String? id,
    required String nom,
    required String type,

    /// Chemin du document dans Firebase Storage
    required String documentPath,
    @deprecated required String idCategory,
    required List<String> keyword,
    required String description,
    required String shortDescription,

    /// Nom de la catégorie principale : Médiathèque, Notice Constructeur, Pièces Fournisseurs
    required String mainCategory,

    /// Nom du fichier de l'image. On reconstitue le chemin avec le mainCategory
    required String image,
  }) = _ResourceDTO;

  factory ResourceDTO.fromDomain(Resource obj) {
    return ResourceDTO(
      id: obj.id.getOrCrash(),
      type: obj.type.toString(),
      documentPath: obj.documentPath,
      idCategory: obj.idCategory.getOrCrash(),
      keyword: obj.keyword,
      description: obj.description,
      nom: obj.nom.getOrCrash(),
      shortDescription: obj.shortDescription,
      mainCategory: obj.mainCategory.toString(),
      image: obj.image,
    );
  }

  Resource toDomain(Reference? storageRef) {
    return Resource(
      id: id != null ? UniqueId.fromUniqueString(id!) : UniqueId.fromUniqueString('-1'),
      nom: Nom(nom),
      type: ResourceType.values.firstWhere((e) => e.toString() == type),
      documentPath: documentPath,
      idCategory: UniqueId.fromUniqueString(idCategory),
      keyword: keyword,
      description: description,
      shortDescription: shortDescription,
      mainCategory: ResourceMainCategoryUtils.fromString(mainCategory),
      image: image,
      imageBytes: !kIsWeb && storageRef != null ? loadImage(storageRef, this.imagePath) : null,
      imageUrl: kIsWeb && storageRef != null ? loadImageWeb(storageRef, this.imagePath) : null,
    );
  }

  String get imagePath => '${ResourceMainCategoryUtils.fromString(mainCategory).nameFile}/$image';

  factory ResourceDTO.fromJson(Map<String, dynamic> json) => _$ResourceDTOFromJson(json);

  factory ResourceDTO.fromFirestore(DocumentSnapshot doc) {
    return ResourceDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
