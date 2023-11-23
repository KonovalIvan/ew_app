import 'dart:convert';

import 'package:ew_app/models/dashboard_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';

class DashboardController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late DashboardInfo dashboard;
  late String projectId;

  Future<Map<String, dynamic>> createRequestBody(
      {String dashboardId = ''}) async {
    Map<String, dynamic> requestData = {
      "name": nameController.text,
      "description": descriptionController.text,
      if (dashboardId != '') "id": dashboardId,
      "project_id": projectId,
    };
    return requestData;
  }

  Future _sendCreateDashboardRequest(String projectId) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';
    this.projectId = projectId;
    var requestBody = await createRequestBody();

    var createUrl = Uri.parse(apiDashboardCreateUrl);
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
      return DashboardShortInfo.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<DashboardShortInfo> createDashboard(
      BuildContext context, String projectId) async {
    try {
      DashboardShortInfo dashboard =
          await _sendCreateDashboardRequest(projectId);
      Navigator.pop(context, dashboard);
      return dashboard;
    } catch (error) {
      // TODO: catch errors!
      print(error);
      rethrow;
    }
  }

  // TODO: All update put method looks the same, create main method in button controller
  Future _sendUpdateDashboardRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var requestBody = await createRequestBody(dashboardId: dashboard.id);

    var updateUrl =
        Uri.parse(apiDashboardUpdateUrl.replaceFirst('{id}', dashboard.id));
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
      return DashboardShortInfo.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> updateDashboard() async {
    try {
      var result = await _sendUpdateDashboardRequest();
      dashboard.name = result.name;
      dashboard.description = result.description;
      return false;
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
    return true;
  }

  void newTask(BuildContext context) {
    Navigator.pushNamed(context, '/task');
  }

  void openTask(BuildContext context) {
    Navigator.pushNamed(context, '/task');
  }

  Future<DashboardInfo> _getDashboardInfo(String dashboardId) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    final url =
        Uri.parse(apiDashboardInfoUrl.replaceFirst('{id}', dashboardId));

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return DashboardInfo.fromJson(data);
    } else {
      // TODO: add custom error
      throw Exception(response.body);
    }
  }

  Future<void> openDashboard(
    BuildContext context,
    String dashboardId,
    DashboardController dashboardController,
    Function function,
  ) async {
    dashboard = await _getDashboardInfo(dashboardId);
    // TODO: when user edit dashboard need call void callback to update previous page with project info!
    // ignore: use_build_context_synchronously
    dynamic returnedId = await Navigator.pushNamed(context, '/dashboard',
        arguments: dashboardController);

    if (returnedId != null) {
      function(returnedId);
    }
  }
}
