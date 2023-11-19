import 'package:json_annotation/json_annotation.dart';

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
