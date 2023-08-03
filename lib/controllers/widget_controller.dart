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