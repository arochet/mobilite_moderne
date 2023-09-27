import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'resource_dtos.freezed.dart';
part 'resource_dtos.g.dart';

@freezed
abstract class ResourceDTO implements _$ResourceDTO {
  const ResourceDTO._();

  const factory ResourceDTO({
    @JsonKey(ignore: true) String? id,
    required String nom,
    required String type,
    required String documentPath,
    required String idCategory,
    required List<String> keyword,
    required String description,
    required String categoryPath,
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
      categoryPath: 'undefined',
    );
  }

  Resource toDomain() {
    return Resource(
      id: id != null ? UniqueId.fromUniqueString(id!) : UniqueId.fromUniqueString('-1'),
      nom: Nom(nom),
      type: ResourceType.values.firstWhere((e) => e.toString() == type),
      documentPath: documentPath,
      idCategory: UniqueId.fromUniqueString(idCategory),
      keyword: keyword,
      description: description,
    );
  }

  factory ResourceDTO.fromJson(Map<String, dynamic> json) => _$ResourceDTOFromJson(json);

  factory ResourceDTO.fromFirestore(DocumentSnapshot doc) {
    return ResourceDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
