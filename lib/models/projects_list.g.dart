// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsList _$ProjectsListFromJson(Map<String, dynamic> json) => ProjectsList(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsListToJson(ProjectsList instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
