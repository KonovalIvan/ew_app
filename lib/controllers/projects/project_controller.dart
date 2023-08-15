import 'package:flutter/material.dart';

class ProjectsListController {

  bool _isExpanded = false;
  String _filterText = 'In progress';

  bool get isExpanded => _isExpanded;
  String get filterText => _filterText;

  set isExpanded(bool value) {
    _isExpanded = value;
  }
  set filterText(String value) {
    _filterText = value;
  }

  void newProject(BuildContext context) {
    Navigator.pushNamed(context, '/project');
  }
}
