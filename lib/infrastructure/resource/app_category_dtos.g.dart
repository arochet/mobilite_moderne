// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_category_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppCategoryDTOImpl _$$AppCategoryDTOImplFromJson(Map<String, dynamic> json) =>
    _$AppCategoryDTOImpl(
      nom: json['nom'] as String,
      listResource: (json['listResource'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AppCategoryDTOImplToJson(
        _$AppCategoryDTOImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'listResource': instance.listResource,
    };
