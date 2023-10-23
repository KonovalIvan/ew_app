import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:ew_app/constants/url.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  bool _showPassword = false;
  bool _isCheckedTermsAndConditions = false;
  String _errorText = '';
  bool _showErrorText = false;

  String email = '';
  String password = '';
  String confirmPassword = '';

  bool get showPassword => _showPassword;

  bool get isCheckedTermsAndConditions => _isCheckedTermsAndConditions;

  String get errorText => _errorText;

  bool get showErrorText => _showErrorText;

  set showPassword(bool value) {
    _showPassword = value;
  }

  set isCheckedTermsAndConditions(bool value) {
    _isCheckedTermsAndConditions = value;
  }

  set errorText(String value) {
    _errorText = value;
  }

  set showErrorText(bool value) {
    _showErrorText = value;
  }

  bool emailValidator() {
    final emailPattern = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailPattern.hasMatch(email);
  }

  void validate() {
    if (!emailValidator()) {
      errorText = 'Invalid email format';
    } else if (password != confirmPassword || password == '') {
      errorText = 'Passwords do not match';
    }
  }

  Future<void> _sendRegisterRequest() async {
    final url = Uri.parse(apiAuthRegisterUrl);
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
      },
    );
    print(response);
    if (response.statusCode == 401) {
      errorText = 'Probably wrong data Error';
    } else {
      errorText = 'Error, please contact with us';
    }
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  Future<void> register(BuildContext context) async {
    // TODO: create logic for sending accept email and change navigator to
    //check email address, and then after confirm redirect to almost done view
    errorText = '';
    validate();
    if (errorText != '') {
      showErrorText = true;
      print(errorText);
      return;
    }
    await _sendRegisterRequest();
    if (errorText != '') {
      showErrorText = true;
      print(errorText);
      return;
    }
    Navigator.pushNamed(context, '/almost_done');
  }
}
