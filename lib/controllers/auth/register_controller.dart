import 'package:flutter/material.dart';

class RegisterController {
  bool _showPassword = false;
  bool _isCheckedTermsAndConditions = false;

  bool get showPassword => _showPassword;
  bool get isCheckedTermsAndConditions => _isCheckedTermsAndConditions;

  set showPassword(bool value) {
    _showPassword = value;
  }
  set isCheckedTermsAndConditions(bool value) {
    _isCheckedTermsAndConditions = value;
  }
  void login(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/almost_done');
  }
}