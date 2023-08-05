import 'package:flutter/material.dart';

class DashboardController {

  void push(BuildContext context) {
    // logic for pressed button already have account
    Navigator.pushNamed(context, '/dashboard');
  }

}