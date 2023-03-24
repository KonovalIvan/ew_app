import 'package:flutter/material.dart';

import 'package:ew_app/controllers/login_controller.dart';

import 'package:ew_app/views/home_view.dart';
import 'package:ew_app/views/login_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LoginView(LoginController()),
  '/home': (BuildContext context) => const HomeView(),
};