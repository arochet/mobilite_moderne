// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResourceDTO _$$_ResourceDTOFromJson(Map<String, dynamic> json) =>
    _$_ResourceDTO(
      nom: json['nom'] as String,
      type: json['type'] as String,
      documentPath: json['documentPath'] as String,
      idCategory: json['idCategory'] as String,
      keyword: json['keyword'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ResourceDTOToJson(_$_ResourceDTO instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'type': instance.type,
      'documentPath': instance.documentPath,
      'idCategory': instance.idCategory,
      'keyword': instance.keyword,
      'description': instance.description,
    };
