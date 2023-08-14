import 'package:flutter/material.dart';

class ForgotPasswordController {

  void sendEmail(BuildContext context) {
    // logic for pressed button already have account
    Navigator.pushNamed(context, '/check_email');
  }

}