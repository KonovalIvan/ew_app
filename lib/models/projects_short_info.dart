
import 'package:json_annotation/json_annotation.dart';

part 'projects_short_info.g.dart';

@JsonSerializable()
// TODO: fix polish language (probably problem in encoding)
class ProjectsShortInfo {
  final String name;
  final String id;
  final String description;
  final bool finished;

  @JsonKey(name: 'main_image')
  final String mainImage;

  ProjectsShortInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.finished,
    required this.mainImage,
  });

  factory ProjectsShortInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectsShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsShortInfoToJson(this);
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