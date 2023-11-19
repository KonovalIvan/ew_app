// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

DashboardsList _$DashboardsListFromJson(Map<String, dynamic> json) =>
    DashboardsList(
      dashboards: (json['dashboards'] as List<dynamic>)
          .map((e) => Dashboard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardsListToJson(DashboardsList instance) =>
    <String, dynamic>{
      'dashboards': instance.dashboards,
    };
