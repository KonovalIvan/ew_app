import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/views/task_short_description_widget.dart';

class MyTaskView extends StatefulWidget {
  const MyTaskView({
    Key? key,
    required this.dashboardController,
  }) : super(key: key);

  final DashboardController dashboardController;


  @override
  // ignore: library_private_types_in_public_api
  _MyTaskViewState createState() => _MyTaskViewState();
}

class _MyTaskViewState extends State<MyTaskView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
      ),
      body: Container(
        decoration: backgroundDecorationGradient,
        padding: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 100.0,
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
