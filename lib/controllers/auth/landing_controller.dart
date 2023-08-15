import 'package:flutter/material.dart';

class LandingController {

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}