// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bearer_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BearerToken _$BearerTokenFromJson(Map<String, dynamic> json) => BearerToken(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$BearerTokenToJson(BearerToken instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
