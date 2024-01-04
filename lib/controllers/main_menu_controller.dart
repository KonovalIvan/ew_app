import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuController {

  void home(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
  }

  void projects(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/projects_list');
  }

  void account(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void currentTask(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void finishedProjects(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void buildingRegulations(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void settings(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void push(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  void faq(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/soon');
  }

  Future<void> _removeCashe() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> logOut(BuildContext context) async {
    _removeCashe();
    Navigator.pushNamed(context, '/');
  }
}