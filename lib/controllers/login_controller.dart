import 'package:flutter/material.dart';

class LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _showPasswordError = false;
  final String _passwordErrorText = 'Incorrect password';
  bool _showLoginError = false;
  final String _loginErrorText = 'Incorrect login';

  String get getPasswordErrorText => _passwordErrorText;
  bool get getShowPasswordError => _showPasswordError;
  String get getLoginErrorText => _loginErrorText;
  bool get getShowLoginError => _showLoginError;

  void login(BuildContext context) {
    // if (validateInputs()) {
    //   Navigator.pushNamed(context, '/home');
    // }
    Navigator.pushNamed(context, '/home');
  }

  bool validateInputs() {
    bool returningValue = true;
    _showPasswordError = false;
    _showLoginError = false;

    if (emailController.text.isEmpty) {
      _showLoginError = true;
      returningValue = false;
    }

    if (passwordController.text.isEmpty) {
      _showPasswordError = true;
      returningValue = false;
    }

    return returningValue;
  }
}