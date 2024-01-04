// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskShortInfo _$TaskShortInfoFromJson(Map<String, dynamic> json) =>
    TaskShortInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      updateDate: json['updated_at'] as String,
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$TaskShortInfoToJson(TaskShortInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'finished': instance.finished,
      'id': instance.id,
      'updated_at': instance.updateDate,
    };

TaskFullInfo _$TaskFullInfoFromJson(Map<String, dynamic> json) => TaskFullInfo(
      json['description'] as String?,
      json['image_gallery'] == null
          ? null
          : ImageShortInfoList.fromJson(json['image_gallery'] as List<dynamic>),
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_id'] as String,
      id: json['id'] as String,
      finished: json['finished'] as bool,
      name: json['name'] as String,
      createDate: json['created_at'] as String,
      lastUpdateDate: json['updated_at'] as String,
    );

Map<String, dynamic> _$TaskFullInfoToJson(TaskFullInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'name': instance.name,
      'description': instance.description,
      'finished': instance.finished,
      'created_at': instance.createDate,
      'updated_at': instance.lastUpdateDate,
      'image_gallery': instance.gallery,
      'comments': instance.comments,
    };

TasksShortInfoList _$TasksShortInfoListFromJson(Map<String, dynamic> json) =>
    TasksShortInfoList(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksShortInfoListToJson(TasksShortInfoList instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
