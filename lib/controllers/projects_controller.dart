import 'package:flutter/material.dart';

class ProjectsController {

  void newProject(BuildContext context) {
    Navigator.pushNamed(context, '/project');
  }
}