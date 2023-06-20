import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ew_app/models/projects_list.dart';

import 'package:ew_app/models/exceptions/user_exceptions.dart';

Future<Object> getProjectList(String apiUrl) async {
  // Here we can get list of projects
  var url = Uri.parse(apiUrl);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return ProjectsList.fromJson(json.decode(response.body));
  } else {
    return LoginException();
  }
}