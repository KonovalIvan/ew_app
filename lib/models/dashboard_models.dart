import 'package:json_annotation/json_annotation.dart';

import 'task_models.dart';

part 'dashboard_models.g.dart';

@JsonSerializable()
class DashboardShortInfo {
  final String id;
  final String name;
  final String? description;

  DashboardShortInfo({
    this.description,
    required this.id,
    required this.name,
  });

  factory DashboardShortInfo.fromJson(Map<String, dynamic> json) =>
      _$DashboardShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardShortInfoToJson(this);
}

@JsonSerializable()
class DashboardsList {
  final List<DashboardShortInfo> dashboards;

  DashboardsList({required this.dashboards});

  factory DashboardsList.fromJson(List<dynamic> json) {
    List<DashboardShortInfo> dashboardsList = [];
    for (var item in json ?? []) {
      dashboardsList.add(DashboardShortInfo.fromJson(item));
    }
    return DashboardsList(dashboards: dashboardsList);
  }
}

@JsonSerializable()
class DashboardInfo {
  final String id;
  final String name;

  @JsonKey(name: 'project_name')
  final String projectName;

  final String? description;

  @JsonKey(name: 'task')
  final TasksShortInfoList? tasksList;

  DashboardInfo({
    this.description,
    this.tasksList,
    required this.projectName,
    required this.id,
    required this.name,
  });

  factory DashboardInfo.fromJson(Map<String, dynamic> json) =>
      _$DashboardInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardInfoToJson(this);
}
