import 'dart:convert';

import 'package:ew_app/constants/url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/models/task_models.dart';

class TaskController {
  bool visibleStatusList = false;
  String taskStatus = 'In progress';
  late String dashboardId;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<Map<String, dynamic>> createRequestBody() async {
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

    var requestBody = await createRequestBody();

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

  Future<TaskShortInfo> createTask(
      BuildContext context, String dashboardId) async {
    try {
      this.dashboardId = dashboardId;
      TaskShortInfo taskShortInfo = await _sendCreateTaskRequest();
      return taskShortInfo;
    } catch (error) {
      // TODO: catch errors!
      print(error);
      rethrow;
    }
  }

  void updateVisibleStatusList({String status = ''}) {
    visibleStatusList = !visibleStatusList;
    if (taskStatus != '') {
      taskStatus = status;
    }
  }
}
