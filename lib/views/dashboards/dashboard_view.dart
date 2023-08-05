import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/project_input_field.dart';
import 'package:ew_app/widgets/main_drawer_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/small_gallery_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/buttons/main_button_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  void updateVisibleDeleteMenu() {
    setState(() {});
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Expanded(
                child: Text(
                  'Disassembly work work work work work work work ',
                  style: SafeGoogleFont('Poppins',
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Column(
                    children: [
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: true,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
                        taskName: 'Zaprojektowanie układu pomieszczeń',
                        done: false,
                        projectName: 'Nowa Siedziba Firmy XYZ',
                        lastActivity: '10:00',
                      ),
                      TaskShortDescriptionWidget(
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
              onPressed: updateVisibleDeleteMenu,
              buttonColor: const Color(0x9037E888),
              buttonText: 'New',
            ),
          ],
        ),
      ),
    );
  }
}

class TaskShortDescriptionWidget extends StatefulWidget {
  const TaskShortDescriptionWidget(
      {Key? key,
      required this.done,
      required this.taskName,
      required this.projectName,
      required this.lastActivity})
      : super(key: key);

  final String taskName;
  final String projectName;
  final String lastActivity;
  final bool done;

  @override
  // ignore: library_private_types_in_public_api
  _TaskShortDescriptionWidgetState createState() =>
      _TaskShortDescriptionWidgetState();
}

class _TaskShortDescriptionWidgetState
    extends State<TaskShortDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6, top: 6),
              child: SvgPicture.asset(
                widget.done == true
                    ? 'assets/icons/done.svg'
                    : 'assets/icons/accept_ring.svg',
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.taskName,
                    style: SafeGoogleFont('Poppins',
                        fontSize: 20.0,
                        color: widget.done ? Color(0x80FFFFFF) : Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration:
                            widget.done ? TextDecoration.lineThrough : null,
                        decorationThickness: 2.0),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.projectName,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 15.0,
                            color: const Color(0x70FFFFFF),
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            width: 15,
                            height: 15,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            widget.lastActivity,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 15.0,
                              color: const Color(0x70FFFFFF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
