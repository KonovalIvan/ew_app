import 'package:flutter/material.dart';

class BackArrowButtonController {
  void back(BuildContext context) {
    // logic for pressed button back
    Navigator.pop(context);
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

  void pressYesDelete(BuildContext context) {
    Navigator.pop(context);
  }

}