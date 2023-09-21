import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/resources/resource.dart';

import 'app_category_failure.dart';

part 'app_category.freezed.dart';

@freezed
abstract class AppCategory with _$AppCategory {
  const AppCategory._();

  const factory AppCategory({
    required UniqueId id,

    /// Nom d'affichage de la catégorie
    required Nom nom,

    /// Les sous catégories de la catégories, remplis dans le repository
    required Either<AppCategoryFailure, List<AppCategory>>? subcategory,

    /// Chemin de la catégorie pour y accéder dans FireStore. Exemple : MLKDJEL/subcategory/qLKLJKD
    required String path,

    /// Liste des documents reliés à la catégorie
    List<Resource>? listResource,
  }) = _AppCategory;

  factory AppCategory.empty() =>
      AppCategory(id: UniqueId(), nom: Nom(''), subcategory: null, path: "", listResource: []);
}
