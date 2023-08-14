import 'package:flutter/material.dart';

class TaskController {
  bool visibleStatusList = false;
  String taskStatus = 'In progress';

  void updateVisibleStatusList({String status = ''}) {
      visibleStatusList = !visibleStatusList;
      if (taskStatus != '') {
        taskStatus = status;
      }
  }
}