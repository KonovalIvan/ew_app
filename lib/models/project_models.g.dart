// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsShortInfo _$ProjectsShortInfoFromJson(Map<String, dynamic> json) =>
    ProjectsShortInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      finished: json['finished'] as bool,
      mainImage: json['main_image'] as String?,
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
      User.fromJson(json['building_master'] as Map<String, dynamic>),
      json['client'] as String,
      DashboardsList.fromJson(json['dashboard'] as List<dynamic>),
      ImagesList.fromJson(json['project_gallery'] as List<dynamic>),
      designer: User.fromJson(json['designer'] as Map<String, dynamic>),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      finished: json['finished'] as bool,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProjectInfoToJson(ProjectInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'finished': instance.finished,
      'designer': instance.designer,
      'building_master': instance.buildingMaster,
      'client': instance.client,
      'address': instance.address,
      'dashboard': instance.dashboardsList,
      'project_gallery': instance.imagesList,
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
