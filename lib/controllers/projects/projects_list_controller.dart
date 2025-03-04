import 'dart:convert';

import 'package:ew_app/controllers/home_controller.dart';
import 'package:ew_app/models/active_projects_and_task.dart';
import 'package:ew_app/models/project_models.dart';
import 'package:ew_app/models/user_models.dart';
import 'package:ew_app/views/projects/new_project_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';

class ProjectsListController {
  bool isExpanded = false;
  String filterText = 'In progress';

  late List<ProjectsShortInfo> projects;

  void newProject(
    BuildContext context,
    VoidCallback voidCallback,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewProjectView(
          voidCallback: voidCallback,
        ),
      ),
    );
  }

  Future _sendProjectsShortInfoListRequest(
      String accessToken, SharedPreferences prefs) async {
    final url = Uri.parse(apiProjectsShortInfoUrl);
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final activeProjectsAndTasksResponse =
          ProjectsShortInfoList.fromJson(data);
      prefs.setString('projectsShortInfoList', jsonEncode(data));

      return activeProjectsAndTasksResponse;
    } else {
      // TODO: add custom exception here and everywhere we use throw!
      throw Exception;
    }
  }

  Future<void> getProjectsInfo(bool? ignorePrefs) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';
    String projectsShortInfoList =
        prefs.getString('projectsShortInfoList') ?? '';
    if (projectsShortInfoList.isNotEmpty && !ignorePrefs!) {
      List<dynamic> jsonList = jsonDecode(projectsShortInfoList);
      projects = ProjectsShortInfoList.fromJson(jsonList).projects.toList();
    }

    if (projectsShortInfoList.isEmpty || ignorePrefs!) {
      try {
        final projectsShortInfoListResponse =
            await _sendProjectsShortInfoListRequest(accessToken, prefs);
        projects = projectsShortInfoListResponse.projects;
      } catch (error) {
        // TODO: catch errors!
        print(error);
      }
    }
  }

  Future<(User, ActiveProjectsAndTasks)> refreshProjectListPage() async {
    HomeController controller = HomeController();
    await controller.getUserInfo(true);
    await getProjectsInfo(true);
    return (controller.user, controller.activeProjectsAndTasks);
  }

}
