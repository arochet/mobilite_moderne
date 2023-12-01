// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceDTOImpl _$$ResourceDTOImplFromJson(Map<String, dynamic> json) =>
    _$ResourceDTOImpl(
      nom: json['nom'] as String,
      type: json['type'] as String,
      documentPath: json['documentPath'] as String,
      idCategory: json['idCategory'] as String,
      keyword:
          (json['keyword'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      mainCategory: json['mainCategory'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ResourceDTOImplToJson(_$ResourceDTOImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'type': instance.type,
      'documentPath': instance.documentPath,
      'idCategory': instance.idCategory,
      'keyword': instance.keyword,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'mainCategory': instance.mainCategory,
      'image': instance.image,
    };
