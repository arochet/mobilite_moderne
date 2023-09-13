import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/article/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    List<String>? listDocument,
  }) = _CategoryDTO;

  factory CategoryDTO.fromDomain(Category obj) {
    return CategoryDTO(
      idCategory: obj.id.getOrCrash(),
      nom: obj.nom.getOrCrash(),
      listDocument: obj.listDocument,
    );
  }

  Category toDomain(Future<Either<CategoryFailure, List<Category>>>? subcategory, String path) {
    printDev();
    return Category(
      id: UniqueId.fromUniqueString(idCategory!),
      nom: Nom(nom),
      subcategory: subcategory,
      path: path,
      listDocument: listDocument,
    );
  }

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);

  factory CategoryDTO.fromFirestore(DocumentSnapshot doc) {
    return CategoryDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(idCategory: doc.id);
  }
}
