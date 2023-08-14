import 'package:flutter/material.dart';

class HomeController {

  void task(BuildContext context) {

    Navigator.pushNamed(context, '/my_task');
  }

  void projects(BuildContext context) {

    Navigator.pushNamed(context, '/projects_list');
  }

  void calculator(BuildContext context) {

    Navigator.pushNamed(context, '/soon');
  }
}