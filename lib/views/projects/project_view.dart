import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/small_gallery_widget.dart';

import 'package:ew_app/controllers/dashboards/dashboard_controller.dart';
import 'package:ew_app/controllers/projects/project_controller.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  final ProjectController _projectController = ProjectController();

  bool _editable = false;
  bool _visibleOptionsMenu = false;
  bool _visibleDeleteMenu = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double currentPosition = _scrollController.offset;
  }

  void updateEditable() {
    setState(() {
      _editable = true;
      _visibleOptionsMenu = !_visibleOptionsMenu;
    });
  }

  void updateVisibleDeleteMenu() {
    setState(() {
      _visibleDeleteMenu = !_visibleDeleteMenu;
    });
  }

  void updateProject() {
    setState(() {
      // TODO: send saved project to backend
      _editable = false;
    });
  }

  void pressNoDelete() {
    setState(() {
      _visibleDeleteMenu = false;
      _visibleOptionsMenu = false;
    });
  }

  void pressYesDelete() {
    setState(() {
      // TODO: logic for delete project
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(),
        rightIconMenu: OptionsButtonWidget(),
        onRightIconPressed: () {
          setState(() {
            _projectController.updateVisibleMenu();
          });
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundDecorationGradient,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          'Name of project',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SmallGalleryWidget(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  fieldWidth: 164,
                                  editable: _editable,
                                  helpText: 'Client',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  fieldWidth: 164,
                                  editable: _editable,
                                  helpText: 'Owner',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  fieldWidth: 164,
                                  editable: _editable,
                                  helpText: 'Master',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33),
                      child: EditableResizedFieldWidget(
                        fieldWidth: double.infinity,
                        editable: _editable,
                        helpText: 'Address',
                      ),
                    ),
                    _editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              fieldWidth: double.infinity,
                              editable: _editable,
                              helpText: 'Street number',
                            ),
                          )
                        : Container(),
                    _editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              fieldWidth: double.infinity,
                              editable: _editable,
                              helpText: 'Local',
                            ),
                          )
                        : Container(),
                    _editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              fieldWidth: double.infinity,
                              editable: _editable,
                              helpText: 'Post-code',
                            ),
                          )
                        : Container(),
                    _editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              fieldWidth: double.infinity,
                              editable: _editable,
                              helpText: 'City',
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        fieldWidth: double.infinity,
                        editable: _editable,
                        helpText: 'Description',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33, bottom: 17),
                      child: ExpansionTile(
                        iconColor: const Color(0xFFAC33E5),
                        collapsedIconColor: const Color(0xFF260975),
                        title: Text(
                          'Attachments',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: RichText(
                              text: TextSpan(
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                children: [
                                  // TODO: create N elements with link to attachment
                                  const TextSpan(text: 'archiver.rar'),
                                  TextSpan(
                                    text: ' (14 mb)',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0x40FFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          const AddFileButtonWidget(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          'Dashboards',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const DashboardWidget(),
                    const DashboardWidget(),
                    const DashboardWidget(),
                    const DashboardWidget(),
                    _editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              padding: EdgeInsets.zero,
                              height: 21,
                              width: 64,
                              decoration: BoxDecoration(
                                color: const Color(0x40FFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: Text(
                                  '+',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    _projectController.editable
                        ? MainButtonWidget(
                            buttonColor: const Color(0x9037E888),
                            pathToSvg: 'assets/icons/done.svg',
                            onPressed: () {
                              setState(() {
                                _projectController.updateProject();
                              });
                            },
                          )
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          )
                  ],
                ),
              ),
              _projectController.visibleOptionsMenu
                  ? OptionsWidget(
                      positionTop: _scrollController.offset,
                      onPressedEdit: () {
                        setState(() {
                          _projectController.updateEditable();
                        });
                      },
                      onPressedDelete: () {
                        setState(() {
                          _projectController.updateVisibleDeleteMenu();
                        });
                      },
                    )
                  : Container(),
              _projectController.visibleDeleteMenu
                  ? DeleteConfirmButtonWidget(
                      positionTop: _scrollController.offset,
                      onPressedNo: () {
                        setState(() {
                          _projectController.pressNoDelete();
                        });
                      },
                      onPressedYes: () {
                        setState(() {
                          _projectController.pressYesDelete(context);
                        });
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
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
