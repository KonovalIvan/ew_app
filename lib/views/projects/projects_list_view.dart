import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/projects/project_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/menu_button_widget.dart';
import 'package:ew_app/widgets/main_drawer_widget.dart';
import 'package:ew_app/widgets/views/project_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/views/user_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProjectsListView extends StatefulWidget {
  const ProjectsListView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectsListViewState createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<ProjectsListView> {
  final ProjectsListController _projectsListController =
      ProjectsListController();

  void updateFilter(String status) {
    setState(() {
      _projectsListController.filterText = status;
      _projectsListController.isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // TODO: Add search field and icon
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
        rightIconMenu: MenuButtonWidget(),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // TODO: Fix pinning AdminShadeWidget at height 65
                const UserCardWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 38, left: 36, right: 36),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(20, 20)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () {
                          setState(() {
                            _projectsListController.isExpanded =
                                !_projectsListController.isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                _projectsListController.filterText,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(38, 9, 117, 0.85),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                              height: 10,
                              child: SvgPicture.asset(
                                _projectsListController.isExpanded
                                    ? 'assets/icons/triangle.svg'
                                    : 'assets/icons/triangle_active.svg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 22,
                        // color: Colors.black,
                        height: 22,
                        child: GestureDetector(
                          onTap: () {
                            _projectsListController.newProject(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/add.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // TODO: Create generating of Projects and pages
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ProjectWidget(
                        finished: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ProjectWidget(
                        finished: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ProjectWidget(
                        finished: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ProjectWidget(),
                    ),
                  ],
                )
              ],
            ),
            _projectsListController.isExpanded
                ? Positioned(
                    top: 475,
                    left: 0,
                    child: TaskFilterWidget(
                      isExpanded: _projectsListController.isExpanded,
                      updateFilterText: updateFilter,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class TaskFilterWidget extends StatefulWidget {
  bool? isExpanded;
  Function(String) updateFilterText;

  TaskFilterWidget({
    super.key,
    this.isExpanded,
    required this.updateFilterText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TaskFilterWidgetState createState() => _TaskFilterWidgetState();
}

class _TaskFilterWidgetState extends State<TaskFilterWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      alignment: Alignment.center,
      // TODO: add gradient to const file
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(23.0),
          bottomRight: Radius.circular(23.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xFF260D67),
            Color(0xFF572886),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.75),
            blurRadius: 10,
            offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      width: 200,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                widget.updateFilterText('All projects');
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(20, 20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: Text(
                'All projects',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                widget.updateFilterText('In progress');
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(20, 20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: Text(
                'In progress',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                widget.updateFilterText('Finished');
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(20, 20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: Text(
                'Finished',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
