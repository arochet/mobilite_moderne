// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDTO _$$_UserDataDTOFromJson(Map<String, dynamic> json) =>
    _$_UserDataDTO(
      userName: json['userName'] as String,
      userNameLowerCase: json['userNameLowerCase'] as String?,
      passwordCrypted: json['passwordCrypted'] as bool,
      typeAccount: json['typeAccount'] as String,
      idStripe: json['idStripe'] as String?,
    );

Map<String, dynamic> _$$_UserDataDTOToJson(_$_UserDataDTO instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userNameLowerCase': instance.userNameLowerCase,
      'passwordCrypted': instance.passwordCrypted,
      'typeAccount': instance.typeAccount,
      'idStripe': instance.idStripe,
    };
