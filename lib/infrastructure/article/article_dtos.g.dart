// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleDTO _$$_ArticleDTOFromJson(Map<String, dynamic> json) =>
    _$_ArticleDTO(
      title: json['title'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      keyword: json['keyword'] as String,
      listRessources: json['listRessources'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_ArticleDTOToJson(_$_ArticleDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'brand': instance.brand,
      'description': instance.description,
      'keyword': instance.keyword,
      'listRessources': instance.listRessources,
      'category': instance.category,
    };
