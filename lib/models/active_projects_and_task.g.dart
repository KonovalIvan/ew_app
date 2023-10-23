// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_projects_and_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveProjectsAndTasks _$ActiveProjectsAndTasksFromJson(
        Map<String, dynamic> json) =>
    ActiveProjectsAndTasks(
      activeTasks: json['active_tasks'] as int,
      activeProjects: json['active_projects'] as int,
    );

Map<String, dynamic> _$ActiveProjectsAndTasksToJson(
        ActiveProjectsAndTasks instance) =>
    <String, dynamic>{
      'active_tasks': instance.activeTasks,
      'active_projects': instance.activeProjects,
    };
