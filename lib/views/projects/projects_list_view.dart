import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/home_controller.dart';
import 'package:ew_app/controllers/projects/projects_list_controller.dart';
import 'package:ew_app/models/active_projects_and_task.dart';
import 'package:ew_app/models/project_models.dart';
import 'package:ew_app/models/user_models.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/menu_button_widget.dart';
import 'package:ew_app/widgets/main_drawer_widget.dart';
import 'package:ew_app/widgets/views/project_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/views/user_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ProjectsListView extends StatefulWidget {
  ProjectsListView({
    Key? key,
    required this.user,
    required this.activeProjectsAndTasks,
  }) : super(key: key);

  User user;
  ActiveProjectsAndTasks activeProjectsAndTasks;

  @override
  // ignore: library_private_types_in_public_api
  _ProjectsListViewState createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<ProjectsListView> {
  bool showCircularProgressIndicator = true;
  late Iterable<ProjectsShortInfo> projects;
  final ProjectsListController _projectsListController =
      ProjectsListController();

  // TODO: get only `in progress` projects, and after change filters send one more request
  void updateFilter(String status) {
    setState(() {
      _projectsListController.filterText = status;
      _projectsListController.isExpanded = false;

      switch (status) {
        case 'Finished':
          projects = _projectsListController.projects
              .where((project) => project.finished)
              .toList();
          break;
        case 'In progress':
          projects = _projectsListController.projects
              .where((project) => !project.finished)
              .toList();
          break;
        default:
          projects = _projectsListController.projects;
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getProjectsInfo(true);
  }

  Future<void> _getProjectsInfo(bool ignorePrefs) async {
    await _projectsListController.getProjectsInfo(ignorePrefs);
    updateFilter(_projectsListController.filterText);
    showCircularProgressIndicator = false;
  }

  Future<void> _getUserInfo() async {
    HomeController controller = HomeController();
    await controller.getUserInfo(null);
    widget.activeProjectsAndTasks = controller.activeProjectsAndTasks;
  }

  void updateList() {
    showCircularProgressIndicator = true;
    _getProjectsInfo(true);
    _getUserInfo();
  }

  Future<void> _refresh() async {
    var (user, tasks) = await _projectsListController.refreshProjectListPage();
    widget.user = user;
    widget.activeProjectsAndTasks = tasks;
    updateFilter(_projectsListController.filterText);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // TODO: Add search field and icon
        appBar: AppBarWidget(
          leftIcon: BackArrowButtonWidget(update: (widget.user, widget.activeProjectsAndTasks)),
          rightIconMenu: const MenuButtonWidget(),
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // TODO: Fix pinning AdminShadeWidget at height 65
                  UserCardWidget(
                    user: widget.user,
                    activeProjectsAndTasks: widget.activeProjectsAndTasks,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 38, left: 36, right: 36),
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
                                    color:
                                        const Color.fromRGBO(38, 9, 117, 0.85),
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
                              _projectsListController.newProject(
                                  context, updateList);
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // TODO: Create 4 project for 1 page, in case we use filter - show projects from 1st page!
                    children: [
                      if (showCircularProgressIndicator)
                        const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: CircularProgressIndicator())
                      else if (projects.isEmpty)
                        Container(height: 140)
                      else
                        for (var project in projects)
                          Padding(
                            padding: const EdgeInsets.all(
                              20,
                            ),
                            child: ProjectWidget(
                              id: project.id,
                              finished: project.finished,
                              name: project.name,
                              description: project.description ?? '',
                              mainImage: project.mainImage,
                              voidCallback: updateList,
                            ),
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
