import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import 'package:ew_app/widgets/views/task_short_description_widget.dart';

import '../../widgets/fields/editable_resized_field_widget.dart';

//
class NewDashboardView extends StatefulWidget {
  const NewDashboardView({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  final String projectId;

  @override
  // ignore: library_private_types_in_public_api
  _NewDashboardViewState createState() => _NewDashboardViewState();
}

class _NewDashboardViewState extends State<NewDashboardView> {
  final DashboardController _dashboardController = DashboardController();

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
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: EditableResizedFieldWidget(
                textEditingController: _dashboardController.nameController,
                helpTextSize: 24.0,
                inputTextSize: 24.0,
                inputTextColor: Colors.white,
                textAlign: TextAlign.center,
                fieldWidth: double.infinity,
                buttonColor: const Color(0x00c4c4c4),
                editable: true,
                helpText: 'Dashboard Name',
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(),
            ),
            MainButtonWidget(
              onPressed: () {
                _dashboardController.createDashboard(context, widget.projectId);
              },
              buttonColor: const Color(0x9037E888),
              buttonText: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
