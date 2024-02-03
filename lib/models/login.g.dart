// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      accessToken: json['token'] as String,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
