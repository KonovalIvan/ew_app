import 'dart:convert';

import 'package:ew_app/models/exceptions/user_exceptions.dart';
import 'package:ew_app/models/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  bool _showPassword = false;
  bool _showError = false;
  String _errorText = '';

  String email = '';
  String password = '';

  bool get showPassword => _showPassword;
  bool get showError => _showError;
  String get errorText => _errorText;

  set showPassword(bool value) {
    _showPassword = value;
  }
  set showError(bool value) {
    _showError = value;
  }
  set errorText(String value) {
    _errorText = value;
  }

  Future _sendLoginRequest() async {
    final url = Uri.parse(apiAuthLoginUrl);
    final response = await http.post(
      url,
      body: {
        'username': email,
        'password': password,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final loginResponse = Login.fromJson(data);
      return loginResponse;
    } else {
      errorText = '${data["error_msg"] ?? 'Probably wrong data'}';
      throw LoginException;
    }
  }

  Future<void> login(BuildContext context) async {
    // TODO: check password and login and if ok - send request if not set _showError = true
    // password must be minimum 6 letter, upper and lower and minimum 1 symbol
    final prefs = await SharedPreferences.getInstance();
    try {
      final loginResponse = await _sendLoginRequest();
      prefs.setString('accessToken', loginResponse.accessToken);
      prefs.setString('refreshToken', loginResponse.refreshToken);
      prefs.setString('username', email);
      Navigator.pushNamed(context, '/home');
    } catch (error) {
      showError = true;
    }
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot_password');
  }
}