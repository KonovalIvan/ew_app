// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPart _$UserPartFromJson(Map<String, dynamic> json) => UserPart(
      json['first_name'] as String,
      json['last_name'] as String,
    );

Map<String, dynamic> _$UserPartToJson(UserPart instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

UserAvatar _$UserAvatarFromJson(Map<String, dynamic> json) => UserAvatar(
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserAvatarToJson(UserAvatar instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['first_name'] as String?,
      json['last_name'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
    };
