import 'package:flutter/material.dart';

class LoginController {

  bool _showError = false;

  bool get showError => _showError;

  void login(BuildContext context) {
    // TODO: check password and login and if ok pushName if not set _showError = true
    // _showError = true;
    Navigator.pushNamed(context, '/home');
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot_password');
  }
}