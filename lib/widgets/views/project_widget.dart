import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/widgets/project_widget_controller.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key? key,
    this.finished,
  }) : super(key: key);

  final bool? finished;

  @override
  // ignore: library_private_types_in_public_api
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final ProjectWidgetController _projectWidgetController = ProjectWidgetController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _projectWidgetController.openProject(context);
      },
      child: Container(
        width: 300,
        height: 140,
        decoration: const BoxDecoration(
          color: Color(0xFFEBF7FF),
          borderRadius: BorderRadius.all(
            Radius.circular(23.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(54, 12, 167, 0.25),
              blurRadius: 10,
              offset: Offset(-5, 5),
            ),
          ],
        ),
        child: Opacity(
          opacity: widget.finished != null ? 0.5 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 2.0),
                ),
                // TODO: add progress bar
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/base_project.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    widget.finished != null
                        ? Opacity(
                            opacity: 0.8,
                            child: Image.asset(
                              'assets/images/done_project.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 145,
                    height: 21,
                    margin: const EdgeInsets.only(top: 15, bottom: 2),
                    child: Text(
                      "Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SafeGoogleFont('Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF260975)),
                    ),
                  ),
                  SizedBox(
                    width: 145,
                    height: 87,
                    child: Text(
                      "The new development project aims to build a multi-story commercial building in the heart of.aaaaaaaaaaaaaaaaaaaaaaa..",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: SafeGoogleFont('Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF260975)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProjectDashboardWidget extends StatefulWidget {
  const ProjectDashboardWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjectDashboardWidgetState createState() => _ProjectDashboardWidgetState();
}

class _ProjectDashboardWidgetState extends State<ProjectDashboardWidget> {
  final DashboardController _dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.zero,
        height: 33,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0x40FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            _dashboardController.push(context);
          },
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Disassembly work',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              Text(
                '62%',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
