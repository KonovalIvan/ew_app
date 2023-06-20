import 'package:flutter/material.dart';

class LandingController {

  void login(BuildContext context) {
    // logic for pressed button login
    Navigator.pushNamed(context, '/soon');
  }

  void register(BuildContext context) {
    // logic for pressed button register
    Navigator.pushNamed(context, '/404');
  }
}