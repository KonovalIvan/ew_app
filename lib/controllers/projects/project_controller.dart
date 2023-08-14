import 'package:flutter/material.dart';

class ProjectsListController {
  void newProject(BuildContext context) {
    Navigator.pushNamed(context, '/project');
  }
}

class ProjectController {
  bool editable = false;
  bool visibleOptionsMenu = false;
  bool visibleDeleteMenu = false;

  void updateEditable() {
    editable = true;
    visibleOptionsMenu = !visibleOptionsMenu;
  }

  void updateVisibleDeleteMenu() {
    visibleDeleteMenu = !visibleDeleteMenu;
  }

  void updateVisibleMenu() {
    visibleOptionsMenu = !visibleOptionsMenu;
  }

  void updateProject() {
    // TODO: send saved project to backend
    editable = false;
  }

  void pressNoDelete() {
    visibleDeleteMenu = false;
    visibleOptionsMenu = false;
  }

  void pressYesDelete(BuildContext context) {
    // TODO: logic for delete project
    Navigator.pop(context);
  }

}
