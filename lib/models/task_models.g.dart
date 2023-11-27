// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskShortInfo _$TaskShortInfoFromJson(Map<String, dynamic> json) =>
    TaskShortInfo(
      name: json['name'] as String,
      updateDate: DateTime.parse(json['updated_at'] as String),
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$TaskShortInfoToJson(TaskShortInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'finished': instance.finished,
      'updated_at': instance.updateDate.toIso8601String(),
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
