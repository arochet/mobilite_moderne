import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';

part 'article.freezed.dart';

@freezed
abstract class Article with _$Article {
  const Article._();

  const factory Article({
    required UniqueId id,
    required Nom title,
    required Nom brand,
    required String description,
    required String keyword,
    required String listRessources,
    required String category,
  }) = _Article;

  factory Article.empty() => Article(
        id: UniqueId(),
        title: Nom(''),
        brand: Nom(''),
        description: '',
        keyword: '',
        listRessources: '',
        category: '',
      );
}
