import 'package:flutter/material.dart';

class ProjectsListController {

  void newProject(BuildContext context) {
    Navigator.pushNamed(context, '/project');
  }
}