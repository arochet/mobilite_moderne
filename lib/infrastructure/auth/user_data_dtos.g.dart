// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataDTOImpl _$$UserDataDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDataDTOImpl(
      userName: json['userName'] as String,
      email: json['email'] as String?,
      userNameLowerCase: json['userNameLowerCase'] as String?,
      passwordCrypted: json['passwordCrypted'] as bool,
      typeAccount: json['typeAccount'] as String,
      idStripe: json['idStripe'] as String?,
    );

Map<String, dynamic> _$$UserDataDTOImplToJson(_$UserDataDTOImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'userNameLowerCase': instance.userNameLowerCase,
      'passwordCrypted': instance.passwordCrypted,
      'typeAccount': instance.typeAccount,
      'idStripe': instance.idStripe,
    };
