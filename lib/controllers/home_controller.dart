import 'package:flutter/material.dart';

class HomeController {

  void task(BuildContext context) {

    Navigator.pushNamed(context, '/soon');
  }

  void projects(BuildContext context) {

    Navigator.pushNamed(context, '/projects_list');
  }

  void calculator(BuildContext context) {

    Navigator.pushNamed(context, '/soon');
  }
}