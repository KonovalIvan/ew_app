import 'package:flutter/material.dart';

class CheckEmailController {
  bool _showSendAgain = true;
  bool _showExtraInfo = false;

  bool get showSendAgain => _showSendAgain;
  bool get showExtraInfo => _showExtraInfo;

  set showSendAgain(bool value) {
    _showSendAgain = value;
  }
  set showExtraInfo(bool value) {
    _showExtraInfo = value;
  }

  void sendAgain(BuildContext context) {
  }
}