import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


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
  void addFile(BuildContext context) {
    Navigator.pushNamed(context, '/soon');
  }
}

class OptionsButtonController {
  bool _editable = false;
  bool _visibleOptionsMenu = false;
  bool _visibleDeleteMenu = false;

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

  void updateProject() {
    // TODO: send saved project to backend
    _editable = false;
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
      Navigator.of(context).pop(true);
    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
  }
}
