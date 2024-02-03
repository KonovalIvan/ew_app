import 'dart:convert';

import 'package:ew_app/constants/url.dart';
import 'package:ew_app/models/active_projects_and_task.dart';
import 'package:ew_app/views/projects/projects_list_view.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  // TODO: change user and activeProjectsAndTasks to one model
  late User user;
  late ActiveProjectsAndTasks activeProjectsAndTasks;

  Future _sendUserDetailRequest(String accessToken) async {
    final url = Uri.parse(apiAuthUserDetailUrl);
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
    print(data);
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

  Future<void> getUserInfo(bool? forceUpdate) async {
    final prefs = await SharedPreferences.getInstance();
    String? userFirstName = prefs.getString('userFirstName');
    String? userLastName = prefs.getString('userLastName');
    String email = prefs.getString('email') ?? '';
    String? userAvatar = prefs.getString('userAvatar');

    if (email.isEmpty || forceUpdate == true) {
      try {
        String accessToken = prefs.getString('accessToken') ?? '';
        user = await _sendUserDetailRequest(accessToken);

        prefs.setString('userFirstName', user.firstName);
        prefs.setString('userLastName', user.lastName);
        prefs.setString('email', user.email);
        prefs.setString('userAvatar', user.avatar ?? '');
      } catch (error) {
        print(error);
      }
    } else {
      user =
          User(userFirstName, userLastName, email: email, avatar: userAvatar);
    }

    // TODO: catch errors! In case we get 401 redirect user to login view
    int? activeTasks = prefs.getInt('activeTasks');
    int? activeProjects = prefs.getInt('activeProjects');

    if (activeTasks == null || activeProjects == null || forceUpdate == true) {
      try {
        String accessToken = prefs.getString('accessToken') ?? '';
        final activeProjectsAndTasksResponse =
            await _sendActiveProjectsAndTasksRequest(accessToken);
        activeProjectsAndTasks = activeProjectsAndTasksResponse;
        prefs.setInt('activeTasks', activeProjectsAndTasks.activeTasks);
        prefs.setInt('activeProjects', activeProjectsAndTasks.activeProjects);
      } catch (error) {
        print(error);
      }
    } else {
      activeProjectsAndTasks = ActiveProjectsAndTasks(
          activeTasks: activeTasks, activeProjects: activeProjects);
    }
  }

  void task(BuildContext context) {
    Navigator.pushNamed(context, '/my_task');
  }

  Future<void> projects(BuildContext context, Function? updateHomeView) async {
    await getUserInfo(null);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectsListView(
          user: user,
          activeProjectsAndTasks: activeProjectsAndTasks,
        ),
      ),
    ).then((result) {
      if (result is (User, ActiveProjectsAndTasks) && updateHomeView != null) {
        var (returnedUser, returnedActiveProjectsAndTasks) = result;
        user = returnedUser;
        activeProjectsAndTasks = returnedActiveProjectsAndTasks;
        updateHomeView();
      }
    });
  }

  void calculator(BuildContext context) {
    Navigator.pushNamed(context, '/soon');
  }
}
