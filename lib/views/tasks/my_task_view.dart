import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/options_button_widget.dart';

import '../../widgets/buttons/main_button_widget.dart';
import '../../widgets/comment_widget.dart';
import '../../widgets/task_gallery_widget.dart';
import '../../widgets/views/task_short_description_widget.dart';

class MyTaskView extends StatefulWidget {
  const MyTaskView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyTaskViewState createState() => _MyTaskViewState();
}

class _MyTaskViewState extends State<MyTaskView> {
  void openTask() {
    Navigator.pushNamed(context, '/task');
  }

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
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
              TaskShortDescriptionWidget(
                onPressed: openTask,
                taskName: 'Zaprojektowanie układu pomieszczeń',
                done: false,
                projectName: 'Nowa Siedziba Firmy XYZ',
                lastActivity: '10:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
