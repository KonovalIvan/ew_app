import 'package:flutter/material.dart';

class DashboardController {

  void newTask(BuildContext context) {
    Navigator.pushNamed(context, '/task');
  }

  void openTask(BuildContext context) {
    Navigator.pushNamed(context, '/task');
  }

  void push(BuildContext context) {
    Navigator.pushNamed(context, '/dashboard');
  }

}