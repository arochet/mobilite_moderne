import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';

import '../../DOMAIN/article/category_failure.dart';
part 'category_dtos.freezed.dart';
part 'category_dtos.g.dart';

@freezed
abstract class CategoryDTO implements _$CategoryDTO {
  const CategoryDTO._();

  const factory CategoryDTO({
    @JsonKey(ignore: true) String? idCategory,
    required String nom,
    List<String>? listResource,
  }) = _CategoryDTO;

  factory CategoryDTO.fromDomain(Category obj) {
    return CategoryDTO(
      idCategory: obj.id.getOrCrash(),
      nom: obj.nom.getOrCrash(),
      listResource: obj.listResource?.map((e) => e.id.getOrCrash()).toList(),
    );
  }

  Category toDomain(
      Either<CategoryFailure, List<Category>>? subcategory, String path, List<Resource>? listResource) {
    printDev();
    return Category(
      id: UniqueId.fromUniqueString(idCategory!),
      nom: Nom(nom),
      subcategory: subcategory,
      path: path,
      listResource: listResource,
    );
  }

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);

  factory CategoryDTO.fromFirestore(DocumentSnapshot doc) {
    return CategoryDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(idCategory: doc.id);
  }
}
