import 'package:flutter/material.dart';

class CommentController {
  late bool showHistory = false;

  void openHistory(BuildContext context) {
    showHistory = true;
  }

}