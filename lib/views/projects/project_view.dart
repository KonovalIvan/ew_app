import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/controllers/projects/project_controller.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/models/project_models.dart';
import 'package:ew_app/models/user_models.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:ew_app/widgets/views/project_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/small_gallery_widget.dart';

import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import 'package:ew_app/models/address_models.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({
    Key? key,
    required this.projectController,
  }) : super(key: key);

  final ProjectController projectController;

  @override
  // ignore: library_private_types_in_public_api
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final ScrollController _scrollController = ScrollController();
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectInfo project = widget.projectController.project;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(),
        rightIconMenu: OptionsButtonWidget(),
        onRightIconPressed: () {
          setState(() {
            _optionsButtonController.updateVisibleMenu();
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
                          project.name,
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
                          SmallGalleryWidget(
                            galleryController: GalleryController(),
                            imagesList: project.imagesList,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  initialText: _optionsButtonController.editable
                                      ? project.designer.email
                                      : concatenateUserFields(project.designer),
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: _optionsButtonController.editable
                                      ? 'Designer'
                                      : 'Designer email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  initialText: _optionsButtonController.editable
                                      ? project.buildingMaster.email
                                      : concatenateUserFields(
                                          project.buildingMaster),
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: _optionsButtonController.editable
                                      ? 'Master'
                                      : 'Master email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  initialText: project.client,
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Client',
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
                        initialText: _optionsButtonController.editable
                            ? project.address.addressLine_1
                            : concatenateAddressFields(project.address),
                        fieldWidth: double.infinity,
                        editable: _optionsButtonController.editable,
                        helpText: _optionsButtonController.editable
                            ? 'Street'
                            : 'Address',
                      ),
                    ),
                    _optionsButtonController.editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              initialText: project.address.addressLine_2,
                              fieldWidth: double.infinity,
                              editable: _optionsButtonController.editable,
                              helpText: 'Local',
                            ),
                          )
                        : Container(),
                    _optionsButtonController.editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              initialText: project.address.postCode,
                              fieldWidth: double.infinity,
                              editable: _optionsButtonController.editable,
                              helpText: 'Post-code',
                            ),
                          )
                        : Container(),
                    _optionsButtonController.editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              initialText: project.address.city,
                              fieldWidth: double.infinity,
                              editable: _optionsButtonController.editable,
                              helpText: 'City',
                            ),
                          )
                        : Container(),
                    _optionsButtonController.editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              initialText: project.address.country,
                              fieldWidth: double.infinity,
                              editable: _optionsButtonController.editable,
                              helpText: 'Country',
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        initialText: project.description,
                        fieldWidth: double.infinity,
                        editable: _optionsButtonController.editable,
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
                    for (var dashboard in project.dashboardsList.dashboards)
                      ProjectDashboardWidget(
                        name: dashboard.name,
                      ),
                    _optionsButtonController.editable
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
                                  'Edit',
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
                    _optionsButtonController.editable
                        ? MainButtonWidget(
                            buttonColor: const Color(0x9037E888),
                            pathToSvg: 'assets/icons/done.svg',
                            onPressed: () {
                              setState(() {
                                _optionsButtonController.updateProject();
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
              _optionsButtonController.visibleOptionsMenu
                  ? Positioned(
                      child: Container(
                        color: const Color(0x70000000),
                      ),
                    )
                  : Container(),
              _optionsButtonController.visibleOptionsMenu
                  ? OptionsWidget(
                      positionTop: _scrollController.offset,
                      onPressedEdit: () {
                        setState(() {
                          _optionsButtonController.updateEditable();
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
                      positionTop: _scrollController.offset,
                      onPressedNo: () {
                        setState(() {
                          _optionsButtonController.pressNoDelete();
                        });
                      },
                      onPressedYes: () {
                        setState(() {
                          _optionsButtonController.pressYesDelete(context, apiProjectDeleteUrl, widget.projectController.project.id);
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

String concatenateAddressFields(Address address) {
  var stringAddress = '${address.addressLine_1} ';
  if (address.addressLine_2 != Null) {
    stringAddress += '${address.addressLine_2}, ';
  }
  return "$stringAddress${address.postCode}, ${address.city}, ${address.country}";
}

String concatenateUserFields(User user) {
  var stringUser = '';
  if (user.firstName != Null) {
    stringUser += '${user.firstName} ';
  }
  if (user.lastName != Null) {
    stringUser += user.lastName;
  }
  return stringUser;
}
