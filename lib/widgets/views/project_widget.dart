import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/projects/project_controller.dart';

import 'package:ew_app/constants/url.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key? key,
    required this.finished,
    required this.name,
    required this.id,
    required this.description,
    required this.mainImage, required this.voidCallback,
  }) : super(key: key);

  final bool finished;
  final String name;
  final String id;
  final String description;
  final String mainImage;
  final VoidCallback voidCallback;

  @override
  // ignore: library_private_types_in_public_api
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final ProjectController _projectController = ProjectController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _projectController.openProject(context, _projectController, widget.id, widget.voidCallback);
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
          opacity: widget.finished ? 0.5 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 2.0),
                    child: Stack(
                      children: [
                        Image.network(
                          "$baseUrl${widget.mainImage}",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        widget.finished
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
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 145,
                    height: 21,
                    margin: const EdgeInsets.only(top: 15, bottom: 2),
                    child: Text(
                      widget.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF260975),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 145,
                    height: 87,
                    child: Text(
                      widget.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF260975),
                      ),
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
  const ProjectDashboardWidget({super.key, required this.name});

  final String name;


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
                widget.name,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              // Text(
              //   '62%',
              //   style: SafeGoogleFont(
              //     'Poppins',
              //     fontSize: 14.0,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
