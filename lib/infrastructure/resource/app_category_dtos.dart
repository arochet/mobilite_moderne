import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category.dart';
import 'package:mobilite_moderne/DOMAIN/resources/app_category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';
part 'app_category_dtos.freezed.dart';
part 'app_category_dtos.g.dart';

@freezed
abstract class AppCategoryDTO implements _$AppCategoryDTO {
  const AppCategoryDTO._();

  const factory AppCategoryDTO({
    @JsonKey(ignore: true) String? idCategory,
    required String nom,
    List<String>? listResource,
  }) = _AppCategoryDTO;

  factory AppCategoryDTO.fromDomainWithResource(AppCategory obj, UniqueId idResource) {
    List<String> appListResource = obj.listResource?.map((e) => e.id.getOrCrash()).toList() ?? [];
    appListResource.add(idResource.getOrCrash());
    return AppCategoryDTO(
      idCategory: obj.id.getOrCrash(),
      nom: obj.nom.getOrCrash(),
      listResource: appListResource,
    );
  }

  AppCategory toDomain(
      Either<AppCategoryFailure, List<AppCategory>>? subcategory, String path, List<Resource>? listResource) {
    printDev();
    return AppCategory(
      id: UniqueId.fromUniqueString(idCategory!),
      nom: Nom(nom),
      subcategory: subcategory,
      path: path,
      listResource: listResource,
    );
  }

  factory AppCategoryDTO.fromJson(Map<String, dynamic> json) => _$AppCategoryDTOFromJson(json);

  factory AppCategoryDTO.fromFirestore(DocumentSnapshot doc) {
    return AppCategoryDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(idCategory: doc.id);
  }
}
