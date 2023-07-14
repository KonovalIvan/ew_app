import 'package:ew_app/constants/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class BackArrowController {

  void back(BuildContext context) {
    // logic for pressed button back
    Navigator.pop(context);
  }
}

class MenuWidgetController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void menu(BuildContext context) {
    scaffoldKey.currentState?.openDrawer();

  }
}