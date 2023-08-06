import 'package:ew_app/views/404_view.dart';
import 'package:ew_app/views/auth/additional_information_view.dart';
import 'package:ew_app/views/auth/almost_done_view.dart';
import 'package:ew_app/views/auth/check_email_view.dart';
import 'package:ew_app/views/auth/forgot_password_view.dart';
import 'package:ew_app/views/auth/landing_view.dart';
import 'package:ew_app/views/coming_soon.dart';
import 'package:ew_app/views/projects/project_view.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/views/home_view.dart';

import 'package:ew_app/views/auth/login_view.dart';
import 'package:ew_app/views/auth/register_view.dart';

import 'package:ew_app/views/projects/projects_list_view.dart';

import 'package:ew_app/views/dashboards/dashboard_view.dart';
import 'package:ew_app/views/tasks/task_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const LandingView(),
  '/login': (BuildContext context) => const LoginView(),
  '/register': (BuildContext context) => const RegisterView(),
  '/home': (BuildContext context) => const HomeView(),
  '/soon': (BuildContext context) => const ComingSoonView(),
  '/404': (BuildContext context) => const NotFoundView(),
  '/forgot_password': (BuildContext context) => const ForgotPasswordView(),
  '/check_email': (BuildContext context) => const CheckEmailView(),
  '/almost_done': (BuildContext context) => const AlmostDoneView(),
  '/additional_information': (BuildContext context) =>
      const AdditionalInformationView(),
  '/projects_list': (BuildContext context) => const ProjectsListView(),
  '/project': (BuildContext context) => const ProjectView(),
  '/dashboard': (BuildContext context) => const DashboardView(),
  '/task': (BuildContext context) => const TaskView(),
};
