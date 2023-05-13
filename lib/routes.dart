import 'package:ew_app/views/landing_view.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/login_controller.dart';
import 'package:ew_app/controllers/landing_controller.dart';

import 'package:ew_app/views/home_view.dart';

import 'package:ew_app/views/login_view.dart';
import 'package:ew_app/views/register_view.dart';

import 'controllers/register_controller.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LandingView(LandingController()),
  '/login': (BuildContext context) => LoginView(LoginController()),
  '/register': (BuildContext context) => RegisterView(RegisterController()),
  '/home': (BuildContext context) => const HomeView(),
};