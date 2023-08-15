import 'package:flutter/material.dart';

class CommentController {
  late bool _showHistory = false;
  
  bool get showHistory => _showHistory;

  set showHistory(bool value) {
    _showHistory = value;
  }

  void openHistory(BuildContext context) {
    showHistory = true;
  }

}