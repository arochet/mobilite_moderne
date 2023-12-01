// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationDTOImpl _$$ConversationDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationDTOImpl(
      name: json['name'] as String?,
      dateLastMessage: json['dateLastMessage'] as int?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$$ConversationDTOImplToJson(
        _$ConversationDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateLastMessage': instance.dateLastMessage,
      'isRead': instance.isRead,
    };
