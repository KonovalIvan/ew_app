import 'dart:convert';

import 'package:ew_app/models/address_models.dart';
import 'package:ew_app/models/project_models.dart';
import 'package:ew_app/models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';

class ProjectController {
  late ProjectInfo project;

  Future _sendProjectInfoRequest(String accessToken, String projectId) async {
    final url = Uri.parse(apiProjectInfoUrl.replaceFirst('{id}', projectId));
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
    print('---------------------------------------------------------------');
    print(data);
    if (response.statusCode == 200) {
      final projectInfoResponse = ProjectInfo.fromJson(data);
      return projectInfoResponse;
    } else {
      // TODO: add custom exception here and everywhere we use throw!
      throw Exception;
    }
  }

  Future<void> getProjectsInfo(String projectId) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    try {
      final projectInfoResponse =
          await _sendProjectInfoRequest(accessToken, projectId);
      project = projectInfoResponse;
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
  }

  Future<void> openProject(
    BuildContext context,
    ProjectController projectController,
    String projectId,
  ) async {
    await getProjectsInfo(projectId);
    Navigator.pushNamed(context, '/project', arguments: projectController);
  }
}
