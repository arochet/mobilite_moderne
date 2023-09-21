// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_category_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppCategoryDTO _$$_AppCategoryDTOFromJson(Map<String, dynamic> json) =>
    _$_AppCategoryDTO(
      nom: json['nom'] as String,
      listResource: (json['listResource'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AppCategoryDTOToJson(_$_AppCategoryDTO instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'listResource': instance.listResource,
    };
