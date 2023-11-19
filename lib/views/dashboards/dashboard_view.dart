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
  const DashboardView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController _dashboardController = DashboardController();

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
                  'Disassembly work',
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
                      TaskShortDescriptionWidget(
                        onPressed: (){
                          _dashboardController.openTask(context);
                        },
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        onPressed: (){
                          _dashboardController.openTask(context);
                        },
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MainButtonWidget(
              onPressed: (){
                _dashboardController.newTask(context);
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
