import 'package:flutter/cupertino.dart';

class ProjectWidgetController {

  void openProject(BuildContext context) {
    Navigator.pushNamed(context, '/project');
  }
}