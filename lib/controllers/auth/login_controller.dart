import 'package:flutter/material.dart';

class LoginController {
  bool _showPassword = false;
  bool _showError = false;

  bool get showPassword => _showPassword;
  bool get showError => _showError;

  set showPassword(bool value) {
    _showPassword = value;
  }
  set showError(bool value) {
    _showError = value;
  }

  void login(BuildContext context) {
    // TODO: check password and login and if ok pushName if not set _showError = true
    Navigator.pushNamed(context, '/home');
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot_password');
  }
}