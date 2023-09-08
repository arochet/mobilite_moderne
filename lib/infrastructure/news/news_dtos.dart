import 'package:mobilite_moderne/DOMAIN/core/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/auth/value_objects.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart';
part 'news_dtos.freezed.dart';
part 'news_dtos.g.dart';

@freezed
abstract class NewsDTO implements _$NewsDTO {
  const NewsDTO._();

  const factory NewsDTO({
    @JsonKey(ignore: true) String? id,
    required String title,
    required String content,
    required String image,
    required String subcontent,
    required List<String> keywords,
  }) = _NewsDTO;

  factory NewsDTO.fromDomain(News obj) {
    return NewsDTO(
      id: obj.id.getOrCrash(),
      title: obj.title.getOrCrash(),
      content: obj.content,
      image: obj.image,
      subcontent: obj.subcontent,
      keywords: obj.keywords,
    );
  }

  News toDomain({Future<Uint8List?>? imageBytes}) {
    return News(
      id: UniqueId.fromUniqueString(id!),
      title: Nom(title),
      content: content,
      image: image,
      subcontent: subcontent,
      keywords: keywords,
      imageBytes: imageBytes,
    );
  }

  factory NewsDTO.fromJson(Map<String, dynamic> json) => _$NewsDTOFromJson(json);

  factory NewsDTO.fromFirestore(DocumentSnapshot doc) {
    return NewsDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
