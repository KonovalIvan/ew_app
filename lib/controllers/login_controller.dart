import 'package:flutter/material.dart';

import 'package:ew_app/api/user_api_service.dart';
import 'package:ew_app/constants/url.dart' as url;

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
    //   getBeaverToken(
    //     url.Constants.apiLoginPost,
    //     emailController.text,
    //     passwordController.text,
    //   );
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
