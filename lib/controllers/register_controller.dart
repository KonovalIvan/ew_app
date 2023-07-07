import 'package:flutter/material.dart';

class RegisterController {

  void login(BuildContext context) {
    // logic for pressed button already have account
    Navigator.pushNamed(context, '/login');
  }

  void register(BuildContext context) {
    // logic for pressed button register
    Navigator.pushNamed(context, '/almost_done');
  }
}