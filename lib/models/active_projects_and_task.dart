import 'package:json_annotation/json_annotation.dart';

part 'active_projects_and_task.g.dart';

@JsonSerializable()
class ActiveProjectsAndTasks {
  @JsonKey(name: 'active_tasks')
  final int activeTasks;

  @JsonKey(name: 'active_projects')
  final int activeProjects;

  ActiveProjectsAndTasks({
    required this.activeTasks,
    required this.activeProjects,
  });

  factory ActiveProjectsAndTasks.fromJson(Map<String, dynamic> json) => _$ActiveProjectsAndTasksFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveProjectsAndTasksToJson(this);
}
