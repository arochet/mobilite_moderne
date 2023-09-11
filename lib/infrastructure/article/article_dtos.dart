import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/article/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'article_dtos.freezed.dart';
part 'article_dtos.g.dart';

@freezed
abstract class ArticleDTO implements _$ArticleDTO {
  const ArticleDTO._();

  const factory ArticleDTO({
    @JsonKey(ignore: true) String? id,
    required String title,
    required String brand,
    required String description,
    required String keyword,
    required String listRessources,
    required String category,
  }) = _ArticleDTO;

  factory ArticleDTO.fromDomain(Article obj) {
    return ArticleDTO(
      id: obj.id.getOrCrash(),
      title: obj.title.getOrCrash(),
      brand: obj.brand.getOrCrash(),
      description: obj.description,
      keyword: obj.keyword,
      listRessources: obj.listRessources,
      category: obj.category,
    );
  }

  Article toDomain() {
    return Article(
      id: UniqueId.fromUniqueString(id!),
      title: Nom(title),
      brand: Nom(brand),
      description: description,
      keyword: keyword,
      listRessources: listRessources,
      category: category,
    );
  }

  factory ArticleDTO.fromJson(Map<String, dynamic> json) => _$ArticleDTOFromJson(json);

  factory ArticleDTO.fromFirestore(DocumentSnapshot doc) {
    return ArticleDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
