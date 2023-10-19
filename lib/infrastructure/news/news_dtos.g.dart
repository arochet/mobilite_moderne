// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsDTO _$$_NewsDTOFromJson(Map<String, dynamic> json) => _$_NewsDTO(
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      subcontent: json['subcontent'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      datePublished: json['datePublished'] as int,
      listRessources: (json['listRessources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_NewsDTOToJson(_$_NewsDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'subcontent': instance.subcontent,
      'keywords': instance.keywords,
      'datePublished': instance.datePublished,
      'listRessources': instance.listRessources,
    };
