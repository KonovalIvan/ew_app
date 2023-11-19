import 'package:json_annotation/json_annotation.dart';

part 'dashboard_models.g.dart';

@JsonSerializable()
class Dashboard {
  final String id;
  final String name;
  final String description;

  // TODO: add progress field

  Dashboard({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class DashboardsList {
  final List<Dashboard> dashboards;

  DashboardsList({required this.dashboards});

  factory DashboardsList.fromJson(List<dynamic> json) {
    List<Dashboard> dashboardsList = [];
    for (var item in json ?? []) {
      dashboardsList.add(Dashboard.fromJson(item));
    }
    return DashboardsList(dashboards: dashboardsList);
  }
}
