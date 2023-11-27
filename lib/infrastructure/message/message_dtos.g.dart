// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDTO _$$_MessageDTOFromJson(Map<String, dynamic> json) =>
    _$_MessageDTO(
      text: json['text'] as String?,
      date: json['date'] as int,
      imagePath: json['imagePath'] as String?,
      videoPath: json['videoPath'] as String?,
      idUser: json['idUser'] as String,
    );

Map<String, dynamic> _$$_MessageDTOToJson(_$_MessageDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'date': instance.date,
      'imagePath': instance.imagePath,
      'videoPath': instance.videoPath,
      'idUser': instance.idUser,
    };
