import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/controllers/projects/project_controller.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/models/project_models.dart';
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

import 'package:ew_app/models/dashboard_models.dart';

import '../../models/gallery_models.dart';

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

  void updateImageList(SingleImage singleImage) {
    setState(() {});
  }
  void update() {
    setState(() {});
  }

  void updateDashboards(var dashboardId) {
    if (dashboardId is String) {
      widget.projectController.project.dashboardsList?.dashboards.removeWhere((
          dashboard) => dashboard.id == dashboardId);
    } else if (dashboardId is DashboardShortInfo) {
      var index = widget.projectController.project.dashboardsList?.dashboards.indexWhere(
              (dashboard) => dashboard.id == dashboardId.id);

      if (index != -1 && index != null) {
        widget.projectController.project.dashboardsList?.dashboards[index] = dashboardId;
      }
    }
    setState(() {});
  }

  void deleteImage(String imageId) {
    var imagesList = widget.projectController.project.imagesList!.images;
    var imageIndex = imagesList.indexWhere((image) => image.id == imageId);

    if (imageIndex != -1) {
      imagesList.removeAt(imageIndex);
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProjectInfo project = widget.projectController.project;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        // TODO: add true if user create or update project, in case when main fields doesnt update - set false.
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
                        // TODO: add change field as ex. description
                        child: EditableResizedFieldWidget(
                          textEditingController:
                              widget.projectController.nameController,
                          helpTextSize: 24.0,
                          inputTextSize: 24.0,
                          inputTextColor: Colors.white,
                          textAlign: TextAlign.center,
                          fieldWidth: 191,
                          buttonColor: const Color(0x00c4c4c4),
                          editable: _optionsButtonController.editable,
                          helpText: 'Project Name',
                          lines: 3,
                          initialText: project.name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallGalleryWidget(
                            galleryController: GalleryController(imagesList: project.imagesList!),
                            imagesList: project.imagesList,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController: widget
                                      .projectController
                                      .designerEmailController,
                                  initialText: project.designer?.email ?? '',
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Designer email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController: widget
                                      .projectController.masterEmailController,
                                  initialText:
                                      project.buildingMaster?.email ?? '',
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Master email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  initialText: project.client,
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Client phone',
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
                        textEditingController:
                            widget.projectController.addressController,
                        initialText: _optionsButtonController.editable
                            ? project.address?.addressLine_1 ?? ''
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
                              textEditingController:
                                  widget.projectController.localController,
                              initialText: project.address?.addressLine_2 ?? '',
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
                              textEditingController:
                                  widget.projectController.postCodeController,
                              initialText: project.address?.postCode ?? '',
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
                              textEditingController:
                                  widget.projectController.cityController,
                              initialText: project.address?.city ?? '',
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
                              textEditingController:
                                  widget.projectController.countryController,
                              initialText: project.address?.country ?? '',
                              fieldWidth: double.infinity,
                              editable: _optionsButtonController.editable,
                              helpText: 'Country',
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            widget.projectController.descriptionController,
                        initialText: project.description,
                        fieldWidth: double.infinity,
                        editable: _optionsButtonController.editable,
                        helpText: 'Description',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33, bottom: 17),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
                          for (var imageShortInfo in widget
                              .projectController.project.imagesList!.images)
                            AttachmentInfoWidget(
                              singleImage: imageShortInfo,
                              deleteImageVoid: deleteImage,
                            ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddFileButtonWidget(
                                    projectController: widget.projectController,
                                    update: updateImageList,
                                  );
                                },
                              );
                            },
                            child: AddFileButtonWidget(
                              projectController: widget.projectController,
                              update: updateImageList,
                            ),
                          ),
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
                    for (var dashboard in project.dashboardsList!.dashboards)
                      ProjectDashboardWidget(
                        dashboard: dashboard, function: updateDashboards, projectId: widget.projectController.project.id
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
                                onPressed: () {
                                  widget.projectController.createDashboard(
                                      context,
                                      widget.projectController.project.id,
                                      update);
                                },
                                style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: Text(
                                  'Add',
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
                            onPressed: () async {
                              _optionsButtonController.editable = await widget
                                  .projectController
                                  .updateProject();
                              setState(() {});
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
                          _optionsButtonController.pressYesDelete(
                              context,
                              apiProjectDeleteUrl,
                              widget.projectController.project.id);
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

String concatenateAddressFields(Address? address) {
  if (address == null) {
    return '';
  }
  var stringAddress = '${address.addressLine_1} ';
  if (address.addressLine_2 != Null) {
    stringAddress += '${address.addressLine_2}, ';
  }
  return "$stringAddress${address.postCode}, ${address.city}, ${address.country}";
}
