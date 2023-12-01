// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChoiceDTOImpl _$$ChoiceDTOImplFromJson(Map<String, dynamic> json) =>
    _$ChoiceDTOImpl(
      nom: json['nom'] as String,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      listRessources: (json['listRessources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ChoiceDTOImplToJson(_$ChoiceDTOImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'question': instance.question,
      'answer': instance.answer,
      'listRessources': instance.listRessources,
    };
