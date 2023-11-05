import 'dart:convert';

import 'package:ew_app/constants/url.dart';
import 'package:ew_app/models/active_projects_and_task.dart';
import 'package:ew_app/views/projects/projects_list_view.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  late String userFirstName;
  late String userLastName;
  late String email;
  int activeProjects = 0;
  int activeTasks = 0;

  Future _sendUserDetailRequest(String accessToken) async {
    final url = Uri.parse(apiAuthUserDetailUrl);
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final userDetailResponse = User.fromJson(data);
      return userDetailResponse;
    } else {
      throw Exception;
    }
  }

  Future _sendActiveProjectsAndTasksRequest(String accessToken) async {
    final url = Uri.parse(apiProjectsTasksActiveUrl);
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final activeProjectsAndTasksResponse =
          ActiveProjectsAndTasks.fromJson(data);
      return activeProjectsAndTasksResponse;
    } else {
      // TODO: add custom exception here and everywhere we use throw!
      throw Exception;
    }
  }

  Future<void> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    userFirstName = prefs.getString('userFirstName') ?? '';
    userLastName = prefs.getString('userLastName') ?? '';
    email = prefs.getString('email') ?? '';
    String accessToken = prefs.getString('accessToken') ?? '';

    if (userFirstName.isEmpty || userLastName.isEmpty || email.isEmpty) {
      try {
        final userDetailResponse = await _sendUserDetailRequest(accessToken);
        prefs.setString('userFirstName', userDetailResponse.firstName);
        prefs.setString('userLastName', userDetailResponse.lastName);
        prefs.setString('email', userDetailResponse.email);
      } catch (error) {
        print(error);
      }
    }
    // TODO: catch errors! In case we get 401 redirect user to login view
    try {
      final activeProjectsAndTasksResponse =
          await _sendActiveProjectsAndTasksRequest(accessToken);
      activeProjects = activeProjectsAndTasksResponse.activeProjects;
      activeTasks = activeProjectsAndTasksResponse.activeTasks;
      print(activeProjects);
      print(activeTasks);
    } catch (error) {
      print(error);
    }
  }

  void task(BuildContext context) {
    Navigator.pushNamed(context, '/my_task');
  }

  Future<void> projects(BuildContext context) async {
    await getUserInfo();
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectsListView(
          activeProjects: activeProjects,
          activeTasks: activeTasks,
          userFirstName: userFirstName,
          email: email,
          userLastName: userLastName,
        ),
      ),
    );
  }

  void calculator(BuildContext context) {
    Navigator.pushNamed(context, '/soon');
  }
}
