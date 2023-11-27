// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardShortInfo _$DashboardShortInfoFromJson(Map<String, dynamic> json) =>
    DashboardShortInfo(
      description: json['description'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DashboardShortInfoToJson(DashboardShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

DashboardsList _$DashboardsListFromJson(Map<String, dynamic> json) =>
    DashboardsList(
      dashboards: (json['dashboards'] as List<dynamic>)
          .map((e) => DashboardShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardsListToJson(DashboardsList instance) =>
    <String, dynamic>{
      'dashboards': instance.dashboards,
    };

DashboardInfo _$DashboardInfoFromJson(Map<String, dynamic> json) =>
    DashboardInfo(
      description: json['description'] as String?,
      tasksList: json['task'] == null
          ? null
          : TasksShortInfoList.fromJson(json['task'] as List<dynamic>),
      projectName: json['project_name'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DashboardInfoToJson(DashboardInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project_name': instance.projectName,
      'description': instance.description,
      'task': instance.tasksList,
    };
