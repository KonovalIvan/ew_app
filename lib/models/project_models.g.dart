// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsShortInfo _$ProjectsShortInfoFromJson(Map<String, dynamic> json) =>
    ProjectsShortInfo(
      json['main_image'] as String?,
      json['description'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$ProjectsShortInfoToJson(ProjectsShortInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'finished': instance.finished,
      'main_image': instance.mainImage,
    };

ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) => ProjectInfo(
      json['designer'] == null
          ? null
          : User.fromJson(json['designer'] as Map<String, dynamic>),
      json['building_master'] == null
          ? null
          : User.fromJson(json['building_master'] as Map<String, dynamic>),
      json['client'] as String?,
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['dashboard'] == null
          ? null
          : DashboardsList.fromJson(json['dashboard'] as List<dynamic>),
      json['image_gallery'] == null
          ? null
          : ImagesList.fromJson(json['image_gallery'] as List<dynamic>),
      json['main_image'] as String?,
      json['description'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$ProjectInfoToJson(ProjectInfo instance) =>
    <String, dynamic>{
      'designer': instance.designer,
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'finished': instance.finished,
      'main_image': instance.mainImage,
      'building_master': instance.buildingMaster,
      'client': instance.client,
      'address': instance.address,
      'dashboard': instance.dashboardsList,
      'image_gallery': instance.imagesList,
    };

ProjectsShortInfoList _$ProjectsShortInfoListFromJson(
        Map<String, dynamic> json) =>
    ProjectsShortInfoList(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => ProjectsShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsShortInfoListToJson(
        ProjectsShortInfoList instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
