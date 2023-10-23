// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_short_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsShortInfo _$ProjectsShortInfoFromJson(Map<String, dynamic> json) =>
    ProjectsShortInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      finished: json['finished'] as bool,
      mainImage: json['main_image'] as String,
    );

Map<String, dynamic> _$ProjectsShortInfoToJson(ProjectsShortInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'finished': instance.finished,
      'main_image': instance.mainImage,
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
