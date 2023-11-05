import 'package:ew_app/models/user_models.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_models.dart';
import 'dashboard_models.dart';
import 'gallery_models.dart';

part 'project_models.g.dart';

@JsonSerializable()
// TODO: fix polish language (probably problem in encoding)
class ProjectsShortInfo {
  final String name;
  final String id;
  final String? description;
  final bool finished;

  @JsonKey(name: 'main_image')
  final String? mainImage;


  ProjectsShortInfo(

    this.mainImage,
      this.description,
    {
    required this.id,
    required this.name,
    required this.finished,
  });

  factory ProjectsShortInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectsShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsShortInfoToJson(this);
}

@JsonSerializable()
class ProjectInfo extends ProjectsShortInfo {
  late User? designer;

  @JsonKey(name: 'building_master')
  late User? buildingMaster;
  late String? client;

  late Address? address;

  @JsonKey(name: 'dashboard')
  late DashboardsList? dashboardsList;

  @JsonKey(name: 'image_gallery')
  late ImagesList? imagesList;

  ProjectInfo(
      this.designer,
      this.buildingMaster,
      this.client,
      this.address,
      this.dashboardsList,
      this.imagesList,
      super.description,
      super.mainImage,
      {
    required super.id,
    required super.name,
    required super.finished,
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectInfoToJson(this);
}

@JsonSerializable()
class ProjectsShortInfoList {
  final List<ProjectsShortInfo> projects;

  ProjectsShortInfoList({required this.projects});

  factory ProjectsShortInfoList.fromJson(List<dynamic> json) {
    List<ProjectsShortInfo> projectList = [];
    for (var item in json) {
      projectList.add(ProjectsShortInfo.fromJson(item));
    }
    return ProjectsShortInfoList(projects: projectList);
  }
}
