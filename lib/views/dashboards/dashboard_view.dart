import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import 'package:ew_app/widgets/views/task_short_description_widget.dart';

import 'package:ew_app/models/task_models.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    Key? key,
    required this.dashboardController,
    required this.updateDashboards,
  }) : super(key: key);

  final DashboardController dashboardController;
  final Function updateDashboards;

  @override
  // ignore: library_private_types_in_public_api
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();

  void addTaskToList(TaskShortInfo taskShortInfo) {
    widget.dashboardController.dashboard.tasksList!.tasks.add(taskShortInfo);
    updateDashboardView();
  }

  void removeTaskFromList(String taskId) {
    widget.dashboardController.dashboard.tasksList!.tasks
        .removeWhere((task) => task.id == taskId);
    updateDashboardView();
  }

  void updateTaskInList(TaskShortInfo taskShortInfo) {
    var index = widget.dashboardController.dashboard.tasksList?.tasks
        .indexWhere((task) => task.id == taskShortInfo.id);

    if (index != -1 && index != null) {
      widget.dashboardController.dashboard.tasksList?.tasks[index] =
          taskShortInfo;
    }
    updateDashboardView();
  }

  void updateDashboardView() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(
          update: true,
        ),
        rightIconMenu: OptionsButtonWidget(),
        onRightIconPressed: () {
          setState(() {
            _optionsButtonController.updateVisibleMenu();
          });
        },
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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
                  child: EditableResizedFieldWidget(
                    textEditingController:
                        widget.dashboardController.nameController,
                    helpTextSize: 24.0,
                    inputTextSize: 24.0,
                    inputTextColor: Colors.white,
                    textAlign: TextAlign.center,
                    fieldWidth: double.infinity,
                    buttonColor: const Color(0x00c4c4c4),
                    editable: _optionsButtonController.editable,
                    helpText: 'Project Name',
                    fontWeight: FontWeight.w500,
                    initialText: widget.dashboardController.dashboard.name,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Column(
                        children: [
                          // TODO: filter by last update and done
                          for (var task in widget
                              .dashboardController.dashboard.tasksList!.tasks)
                            TaskShortDescriptionWidget(
                              taskShortInfo: task,
                              projectName: widget
                                  .dashboardController.dashboard.projectName,
                              deleteTaskFunction: removeTaskFromList,
                              updateTaskListFunction: updateTaskInList,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                _optionsButtonController.editable == false
                    ? MainButtonWidget(
                        onPressed: () {
                          widget.dashboardController.newTask(
                              context,
                              widget.dashboardController.dashboard.id,
                              addTaskToList);
                        },
                        buttonColor: const Color(0x9037E888),
                        buttonText: 'New',
                      )
                    : MainButtonWidget(
                        buttonColor: const Color(0x9037E888),
                        pathToSvg: 'assets/icons/done.svg',
                        onPressed: () async {
                          _optionsButtonController.editable = await widget
                              .dashboardController
                              .updateDashboard();
                          setState(() {});
                        },
                      ),
              ],
            ),
          ),
          _optionsButtonController.visibleOptionsMenu
              ? OptionsWidget(
                  onPressedEdit: () {
                    setState(() {
                      _optionsButtonController.updateEditable();
                      widget.dashboardController.updateProjectView = true;
                    });
                  },
                  onPressedDelete: () {
                    setState(() {
                      _optionsButtonController.updateVisibleDeleteMenu();
                    });
                  },
                )
              : Container(),
          _optionsButtonController.visibleDeleteMenu
              ? DeleteConfirmButtonWidget(
                  onPressedNo: () {
                    setState(() {
                      _optionsButtonController.pressNoDelete();
                    });
                  },
                  onPressedYes: () async {
                    await _optionsButtonController
                        .pressYesDelete(
                      context,
                      apiDashboardDeleteUrl,
                      widget.dashboardController.dashboard.id,
                    )
                        .then((result) {
                      widget.updateDashboards(
                        widget.dashboardController.dashboard.id,
                      );
                    });
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
