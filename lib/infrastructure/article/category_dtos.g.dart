// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryDTO _$$_CategoryDTOFromJson(Map<String, dynamic> json) =>
    _$_CategoryDTO(
      nom: json['nom'] as String,
      listResource: (json['listResource'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_CategoryDTOToJson(_$_CategoryDTO instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'listResource': instance.listResource,
    };
