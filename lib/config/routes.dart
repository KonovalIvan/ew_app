import 'package:ew_app/controllers/404_controller.dart';
import 'package:ew_app/controllers/additional_information_controller.dart';
import 'package:ew_app/controllers/coming_soon_controller.dart';
import 'package:ew_app/controllers/forgot_password_controller.dart';
import 'package:ew_app/views/404.dart';
import 'package:ew_app/views/auth/additional_information_view.dart';
import 'package:ew_app/views/auth/almost_done_view.dart';
import 'package:ew_app/views/auth/check_email_view.dart';
import 'package:ew_app/views/auth/forgot_password_view.dart';
import 'package:ew_app/views/auth/landing_view.dart';
import 'package:ew_app/views/coming_soon.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/login_controller.dart';
import 'package:ew_app/controllers/landing_controller.dart';

import 'package:ew_app/views/home_view.dart';

import 'package:ew_app/views/auth/login_view.dart';
import 'package:ew_app/views/auth/register_view.dart';

import 'package:ew_app/controllers/register_controller.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LandingView(LandingController()),
  '/login': (BuildContext context) => LoginView(LoginController()),
  '/register': (BuildContext context) => RegisterView(RegisterController()),
  '/home': (BuildContext context) => const HomeView(),
  '/soon': (BuildContext context) => const ComingSoonView(),
  '/404': (BuildContext context) => const NotFoundView(),
  '/forgot_password': (BuildContext context) => ForgotPasswordView(ForgotPasswordController()),
  '/check_email': (BuildContext context) => const CheckEmailView(),
  '/almost_done': (BuildContext context) => const AlmostDoneView(),
  '/additional_information': (BuildContext context) => AdditionalInformationView(AdditionalInformationController()),
};