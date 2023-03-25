import 'package:json_annotation/json_annotation.dart';

import 'package:ew_app/models/project.dart';

part 'projects_list.g.dart';

@JsonSerializable()
class ProjectsList {
  List<Project> projects;
  ProjectsList({required this.projects});

  factory ProjectsList.fromJson(Map<String, dynamic> json) =>
      _$ProjectsListFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectsListToJson(this);
}
