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
