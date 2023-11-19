import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import 'package:ew_app/widgets/views/task_short_description_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key, required this.dashboardController}) : super(key: key);

  final DashboardController dashboardController;

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(),
        rightIconMenu: OptionsButtonWidget(),
      ),
      body: Container(
        decoration: backgroundDecorationGradient,
        padding: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 100.0,
        ),
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.dashboardController.dashboard.name,
                  style: SafeGoogleFont('Poppins',
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Column(
                    children: [
                      // TODO: filter by last update and done
                      for (var task in widget.dashboardController.dashboard.tasksList!.tasks)
                    TaskShortDescriptionWidget(
                      onPressed: (){
                        widget.dashboardController.openTask(context);
                      },
                      taskName: task.name,
                      done: task.finished,
                      projectName: widget.dashboardController.dashboard.projectName,
                      // "$baseApiUrl$baseAuthUrl/user-details/"
                      lastActivity: "${task.updateDate.hour}:${task.updateDate.minute}",
                    ),
                    ],
                  ),
                ),
              ),
            ),
            MainButtonWidget(
              onPressed: (){
                widget.dashboardController.newTask(context);
              },
              buttonColor: const Color(0x9037E888),
              buttonText: 'New',
            ),
          ],
        ),
      ),
    );
  }
}
