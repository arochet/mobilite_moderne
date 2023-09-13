import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/article/category_failure.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const Category._();

  const factory Category({
    required UniqueId id,

    /// Nom d'affichage de la catégorie
    required Nom nom,

    /// Les sous catégories de la catégories, remplis dans le repository
    required Future<Either<CategoryFailure, List<Category>>>? subcategory,

    /// Chemin de la catégorie pour y accéder dans FireStore. Exemple : MLKDJEL/subcategory/qLKLJKD
    required String path,

    /// Liste des documents reliés à la catégorie
    List<String>? listDocument,
  }) = _Category;

  factory Category.empty() =>
      Category(id: UniqueId(), nom: Nom(''), subcategory: null, path: "", listDocument: []);
}
