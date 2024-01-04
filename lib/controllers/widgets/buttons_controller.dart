import 'dart:convert';
import 'dart:io';

import 'package:ew_app/models/gallery_models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../constants/url.dart';
import '../projects/project_controller.dart';


class BackArrowButtonController {
  void back(BuildContext context, bool update) {
    Navigator.of(context).pop(update);
  }
}

class MenuButtonController {
  void open(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}

class AddFileButtonController {
  final ImagePicker _picker = ImagePicker();
  late XFile pickedFile;
  late String projectId;
  late String? taskId;

  Future _sendCreateImageRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    var updateUrl =
    Uri.parse(apiImageCreateUrl);

    var request = http.MultipartRequest('POST', updateUrl);
    request.headers['Authorization'] = 'Token $accessToken';

    var file = File(pickedFile.path);
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();

    var multipartFile = http.MultipartFile(
      'image',
      stream,
      length,
      filename: pickedFile.name,
    );
    request.files.add(multipartFile);
    request.fields['project_id'] = projectId;
    request.fields['image_name'] = pickedFile.name;
    if (taskId != null) {
      request.fields['task_id'] = taskId!;
    }

    try {
      var response = await request.send();
      if (response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        var data = jsonDecode(responseData);
        return SingleImage.fromJson(data);
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (error) {
      throw Exception('Failed to upload image: $error');
    }
  }

  Future<SingleImage> addFile(ProjectController? projectController) async {
      try {
        SingleImage image = await _sendCreateImageRequest();

        if (projectController != null) {
          projectId = projectController.project.id;
          projectController.project.imagesList?.images.add(image);
        }
        return image;
      } catch (error) {
        // TODO: catch errors!
        print(error);
        rethrow;
      }
    }

   Future<Object?> getImageFromGallery(ProjectController? projectController, bool returnXFile) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (returnXFile) {
        return pickedFile;
      }
      this.pickedFile = pickedFile;
      SingleImage image = await addFile(projectController);
      return image;
    }
    return null;
  }

  Future<Object?> getImageFromCamera(ProjectController? projectController, bool returnXFile) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (returnXFile) {
        return pickedFile;
      }
      this.pickedFile = pickedFile;
      SingleImage image = await addFile(projectController);
      return image;
    }
    return null;
  }
}

class OptionsButtonController {
  bool _editable = false;
  bool _visibleOptionsMenu = false;
  bool _visibleDeleteMenu = false;
  final ScrollController scrollController = ScrollController();

  bool get visibleOptionsMenu => _visibleOptionsMenu;

  bool get editable => _editable;

  bool get visibleDeleteMenu => _visibleDeleteMenu;

  set visibleOptionsMenu(bool value) {
    _visibleOptionsMenu = value;
  }

  set editable(bool value) {
    _editable = value;
  }

  set visibleDeleteMenu(bool value) {
    _visibleDeleteMenu = value;
  }

  void updateEditable() {
    _editable = true;
    _visibleOptionsMenu = !_visibleOptionsMenu;
  }

  void updateVisibleDeleteMenu() {
    _visibleDeleteMenu = !_visibleDeleteMenu;
  }

  void updateVisibleMenu() {
    _visibleOptionsMenu = !_visibleOptionsMenu;
  }


  void pressNoDelete() {
    visibleDeleteMenu = false;
    visibleOptionsMenu = false;
  }

  Future _sendDeleteObjectRequest(
      String accessToken, String projectId, String url) async {
    /*
    In case when we want delete object API url is the same in all cases:
    api_url/{obj_id}, and in success case backend return 204 status
     */

    var deleteUrl = Uri.parse(url.replaceFirst('{id}', projectId));
    final response = await http
        .delete(deleteUrl, headers: {'Authorization': 'Token $accessToken'});
    if (response.statusCode != 204) {
      // TODO: in response i get error_msg, need in some way print information
      throw Exception(response.statusCode);
    }
  }

  Future<void> pressYesDelete(
      BuildContext context, String requestUrl, String objectId) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    try {
      await _sendDeleteObjectRequest(accessToken, objectId, requestUrl);
      Navigator.of(context).pop(objectId);
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
  }
}
