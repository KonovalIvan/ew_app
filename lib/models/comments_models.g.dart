// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      (json['replies'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['task_id'] as String?,
      json['creator_avatar'] as String?,
      id: json['id'] as String,
      description: json['description'] as String,
      updateDate: json['updated_at'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'updated_at': instance.updateDate,
      'task_id': instance.taskId,
      'creator_avatar': instance.avatar,
      'replies': instance.replies,
    };
