import 'package:flutter/material.dart';

class ForgotPasswordController {

  void sendEmail(BuildContext context) {
    Navigator.pushNamed(context, '/check_email');
  }

}