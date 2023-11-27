import 'dart:convert';

import 'package:ew_app/models/project_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';

import 'package:ew_app/views/dashboards/new_dashboard_view.dart';

class ProjectController {
  late ProjectInfo project;
  final TextEditingController designerEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController masterEmailController = TextEditingController();
  final TextEditingController clientPhoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<Map<String, dynamic>> createRequestBody({bool create = false}) async {
    String? addressLine1 =
        addressController.text.isNotEmpty ? addressController.text : null;
    String? addressLine2 =
        localController.text.isNotEmpty ? localController.text : null;
    String? postCode =
        postCodeController.text.isNotEmpty ? postCodeController.text : null;
    String? city = cityController.text.isNotEmpty ? cityController.text : null;
    String? country =
        countryController.text.isNotEmpty ? countryController.text : null;

    Map<String, dynamic> requestData = {
      "name": nameController.text,
      "designer_email": designerEmailController.text,
      "building_master_email": masterEmailController.text,
      "client_phone": clientPhoneController.text,
      "description": descriptionController.text,
    };

    Map<String, dynamic> addressData = {
      if (addressLine1 != null) "address_line_1": addressLine1,
      if (addressLine2 != null) "address_line_2": addressLine2,
      if (postCode != null) "post_code": postCode,
      if (city != null) "city": city,
      if (country != null) "country": country,
      "id": create ? null : project.address?.id,
    };

    if (addressLine1 != null ||
        addressLine2 != null ||
        postCode != null ||
        city != null ||
        country != null ||
        addressData['id'] != null
    ) {
      requestData["address"] = addressData;
    }
    return requestData;
  }

  Future _sendProjectInfoRequest(String accessToken, String projectId) async {
    final url = Uri.parse(apiProjectInfoUrl.replaceFirst('{id}', projectId));
    final response =
        await http.get(url, headers: {'Authorization': 'Token $accessToken'});
    final data = jsonDecode(response.body);
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

  void createDashboard(BuildContext context, String projectId, VoidCallback voidCallback) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewDashboardView(
          projectId: projectId,
        ),
      ),
    ).then((returnedDashboard) {
      if (returnedDashboard != null) {
        project.dashboardsList!.dashboards.add(returnedDashboard);
        voidCallback();
      }
    });
  }

  Future _sendUpdateProjectRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var requestBody = await createRequestBody();
    // TODO: add changing designer
    requestBody['designer_email'] = prefs.getString('username');

    var updateUrl =
        Uri.parse(apiProjectUpdateUrl.replaceFirst('{id}', project.id));
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
      return ProjectInfo.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> updateProject() async {
    try {
      project = await _sendUpdateProjectRequest();
      return false;
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
    return true;
  }

  Future _sendCreateProjectRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';
    // TODO: fix updating api/projects/projects-tasks-active/
    var requestBody = await createRequestBody(create: true);
    requestBody['designer_email'] = prefs.getString('username');
    var createUrl = Uri.parse(apiProjectCreateUrl);
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
      return ProjectInfo.fromJson(data);
    } else {
      throw Exception;
    }
  }

  Future<void> createProject(
    BuildContext context,
    VoidCallback voidCallback,
  ) async {
    try {
      ProjectInfo createdProject = await _sendCreateProjectRequest();
      project = createdProject;
      Navigator.of(context).pop();
      voidCallback();
      // TODO: add redirect to project view, (currently problem in arguments self.controller)
      // Navigator.pushNamed(context, '/project', arguments: this).then((result) {
      //   if (result == true) {
      //     voidCallback();
      //   }
      // });
    } catch (error) {
      // TODO: catch errors!
      print('Error in create project');
      print(error);
    }
  }

  Future<void> openProject(
    BuildContext context,
    ProjectController projectController,
    String projectId,
    VoidCallback voidCallback,
  ) async {
    await getProjectsInfo(projectId);

    dynamic resultId = await Navigator.pushNamed(context, '/project', arguments: projectController);

    if (resultId != '') {
      voidCallback();
    }
  }
}
