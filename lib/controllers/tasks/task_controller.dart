import 'dart:convert';

import 'package:ew_app/constants/url.dart';
import 'package:ew_app/models/comments_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/models/task_models.dart';

class TaskController {
  bool visibleStatusList = false;
  String taskStatus = 'In progress';


  String userAvatar = '';
  late TaskFullInfo taskFullInfo;
  late String dashboardId;
  bool updateTaskView = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<Map<String, dynamic>> createCommentRequestBody(
    String description,
    String? commentId,
  ) async {
    String fieldName = commentId != null ? "comments_id" : "task_id";
    dynamic value = commentId ?? taskFullInfo.id;

    Map<String, dynamic> requestData = {
      "description": description,
      fieldName: value,
    };
    return requestData;
  }

  Future<Map<String, dynamic>> createTaskRequestBody() async {
    Map<String, dynamic> requestData = {
      "name": nameController.text,
      "description": descriptionController.text,
      if (dashboardId != '') "dashboard_id": dashboardId,
    };
    return requestData;
  }

  Future _sendCreateTaskRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var requestBody = await createTaskRequestBody();

    var createUrl = Uri.parse(apiTaskCreateUrl);
    final response = await http.post(
      createUrl,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return TaskShortInfo.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> createTask(BuildContext context, String dashboardId) async {
    try {
      this.dashboardId = dashboardId;
      TaskShortInfo taskShortInfo = await _sendCreateTaskRequest();
      Navigator.pop(context, taskShortInfo);
    } catch (error) {
      // TODO: catch errors!
      print(error);
      rethrow;
    }
  }

  Future _sendAddCommentRequest(
    String description,
    String? commentId,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var requestBody = await createCommentRequestBody(description, commentId);
    var createUrl = Uri.parse(apiCommentCreateUrl);
    final response = await http.post(
      createUrl,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return Comment.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<Comment> sendComment(
    String description,
    String? commentId,
  ) async {
    try {
      Comment comment = await _sendAddCommentRequest(description, commentId);
      updateCommentsList(commentId, comment);
      return comment;
    } catch (error) {
      // TODO: catch errors!
      print(error);
      rethrow;
    }
  }

  void updateCommentsList(String? commentId, Comment comment) {
    if (commentId != null) {
      Comment existingComment = taskFullInfo.comments!.firstWhere(
        (comment) => comment.id == commentId,
      );
      existingComment.replies!.add(comment);
    } else {
      taskFullInfo.comments!.add(comment);
    }
  }

  Future<TaskFullInfo> _getTaskInfo(String taskId, String accessToken) async {
    final url = Uri.parse(apiTaskInfoUrl.replaceFirst('{id}', taskId));

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TaskFullInfo.fromJson(data);
    } else {
      // TODO: add custom error
      throw Exception(response.body);
    }
  }

  Future<void> openTask(
    BuildContext context,
    String taskId,
    TaskController taskController,
    Function deleteTaskFromList,
    Function updateTaskList,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    taskFullInfo = await _getTaskInfo(taskId, accessToken);
    userAvatar = prefs.getString('userAvatar') ?? '';

    // ignore: use_build_context_synchronously
    dynamic resultId = await Navigator.pushNamed(context, '/task',
        arguments: TaskArguments(taskController));

    if (updateTaskView == true) {
      TaskShortInfo taskShortInfo = TaskShortInfo(
        id: taskFullInfo.id,
        updateDate: taskFullInfo.lastUpdateDate,
        name: taskFullInfo.name,
        finished: taskFullInfo.finished,
      );
      updateTaskList(taskShortInfo);
      updateTaskView = false;
    }

    if (resultId != '' && resultId != bool) {
      deleteTaskFromList(resultId);
    }
  }

  Future _sendUpdateTaskRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var requestBody = await createTaskRequestBody();

    var updateUrl =
        Uri.parse(apiTaskUpdateUrl.replaceFirst('{id}', taskFullInfo.id));
    final response = await http.put(
      updateUrl,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TaskFullInfo.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> updateTask() async {
    try {
      dashboardId = '';
      taskFullInfo = await _sendUpdateTaskRequest();
      return false;
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
    return true;
  }

  void updateVisibleStatusList({String status = ''}) {
    visibleStatusList = !visibleStatusList;
    if (taskStatus != '') {
      taskStatus = status;
    }
  }
}

class TaskArguments {
  final TaskController taskController;

  TaskArguments(this.taskController);
}
