import 'package:json_annotation/json_annotation.dart';

import 'comments_models.dart';
import 'gallery_models.dart';

part 'task_models.g.dart';

@JsonSerializable()
class TaskShortInfo {
  final String name;
  final bool finished;
  final String id;

  @JsonKey(name: 'updated_at')
  final String updateDate;


  TaskShortInfo({
    required this.id,
    required this.name,
    required this.updateDate,
    required this.finished,
  });

  factory TaskShortInfo.fromJson(Map<String, dynamic> json) =>
      _$TaskShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskShortInfoToJson(this);
}

@JsonSerializable()
class TaskFullInfo {
  final String id;

  @JsonKey(name: 'project_id')
  final String projectId;

  final String name;
  final String? description;
  final bool finished;

  @JsonKey(name: 'created_at')
  final String createDate;

  @JsonKey(name: 'updated_at')
  final String lastUpdateDate;

  @JsonKey(name: 'image_gallery')
  final ImageShortInfoList? gallery;

  final List<Comment>? comments;

  TaskFullInfo(
      this.description,
      this.gallery,
      this.comments,
      this.projectId,
      {
    required this.id,
    required this.finished,
    required this.name,
    required this.createDate,
    required this.lastUpdateDate,

  });

  factory TaskFullInfo.fromJson(Map<String, dynamic> json) =>
      _$TaskFullInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskFullInfoToJson(this);
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