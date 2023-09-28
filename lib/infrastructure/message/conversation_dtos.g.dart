// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationDTO _$$_ConversationDTOFromJson(Map<String, dynamic> json) =>
    _$_ConversationDTO(
      name: json['name'] as String?,
      dateLastMessage: json['dateLastMessage'] as int?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$$_ConversationDTOToJson(_$_ConversationDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateLastMessage': instance.dateLastMessage,
      'isRead': instance.isRead,
    };
