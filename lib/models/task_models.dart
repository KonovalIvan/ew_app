import 'package:json_annotation/json_annotation.dart';

part 'task_models.g.dart';

@JsonSerializable()
class TaskShortInfo {
  final String name;
  final bool finished;

  @JsonKey(name: 'updated_at')
  final DateTime updateDate;


  TaskShortInfo({
    required this.name,
    required this.updateDate,
    required this.finished,
  });

  factory TaskShortInfo.fromJson(Map<String, dynamic> json) =>
      _$TaskShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskShortInfoToJson(this);
}

@JsonSerializable()
class TasksShortInfoList {
  final List<TaskShortInfo> tasks;

  TasksShortInfoList({required this.tasks});

  factory TasksShortInfoList.fromJson(List<dynamic> json) {
    List<TaskShortInfo> taskList = [];
    for (var item in json) {
      taskList.add(TaskShortInfo.fromJson(item));
    }
    return TasksShortInfoList(tasks: taskList);
  }
}