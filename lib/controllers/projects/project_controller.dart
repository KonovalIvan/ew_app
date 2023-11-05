import 'dart:convert';

import 'package:ew_app/controllers/projects/projects_list_controller.dart';
import 'package:ew_app/models/project_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';

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

  Future _sendCreateProjectRequest() async {
    String? addressLine1 = addressController.text.isNotEmpty ? addressController.text : null;
    String? addressLine2 = localController.text.isNotEmpty ? localController.text : null;
    String? postCode = postCodeController.text.isNotEmpty ? postCodeController.text : null;
    String? city = cityController.text.isNotEmpty ? cityController.text : null;
    String? country = countryController.text.isNotEmpty ? countryController.text : null;

    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    Map<String, dynamic> addressData = {
      if (addressLine1 != null) "address_line_1": addressLine1,
      if (addressLine2 != null) "address_line_2": addressLine2,
      if (postCode != null) "post_code": postCode,
      if (city != null) "city": city,
      if (country != null) "country": country,
    };

    var createUrl = Uri.parse(apiProjectCreateUrl);
    final response = await http.post(
      createUrl,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        // TODO: get name from nameController.text
        "name": 'Default name',
        "designer_email": prefs.getString('username'),
        "building_master_email": masterEmailController.text,
        "client_phone": clientPhoneController.text,
        "description": descriptionController.text,
        if (addressLine1 != null || addressLine2 != null || postCode != null || city != null || country != null) "address": addressData
      }),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final projectInfoResponse = ProjectInfo.fromJson(data);
      return projectInfoResponse;
    } else {
      throw Exception;
    }
  }

  Future<void> createProject(
    BuildContext context,
    VoidCallback voidCallback,
  ) async {
    try {
      project = await _sendCreateProjectRequest();
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/project', arguments: this)
        .then((result) {
      if (result == true) {
        voidCallback();
      }
    });
  }

  Future<void> openProject(
    BuildContext context,
    ProjectController projectController,
    String projectId,
    VoidCallback voidCallback,
  ) async {
    await getProjectsInfo(projectId);
    Navigator.pushNamed(context, '/project', arguments: projectController)
        .then((result) {
      if (result == true) {
        voidCallback();
      }
    });
  }
}
