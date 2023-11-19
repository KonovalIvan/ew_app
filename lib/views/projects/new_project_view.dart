import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/small_gallery_widget.dart';

import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import '../../controllers/projects/project_controller.dart';

class NewProjectView extends StatefulWidget {
  const NewProjectView({
    Key? key,
    required this.voidCallback,
  }) : super(key: key);

  final VoidCallback voidCallback;

  @override
  // ignore: library_private_types_in_public_api
  _NewProjectViewState createState() => _NewProjectViewState();
}

class _NewProjectViewState extends State<NewProjectView> {
  final ScrollController _scrollController = ScrollController();
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();
  final ProjectController _projectController = ProjectController();

  @override
  void initState() {
    super.initState();
    _optionsButtonController.editable = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(),
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
                        child: EditableResizedFieldWidget(
                          textEditingController:
                              _projectController.nameController,
                          helpTextSize: 24.0,
                          inputTextSize: 24.0,
                          inputTextColor: Colors.white,
                          textAlign: TextAlign.center,
                          fieldWidth: 191,
                          buttonColor: const Color(0x00c4c4c4),
                          editable: _optionsButtonController.editable,
                          helpText: 'Project Name',
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
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController: _projectController
                                      .designerEmailController,
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Designer email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController:
                                      _projectController.masterEmailController,
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Master email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController:
                                      _projectController.clientPhoneController,
                                  fieldWidth: 191,
                                  editable: _optionsButtonController.editable,
                                  helpText: 'Client phone number',
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
                            _projectController.addressController,
                        fieldWidth: double.infinity,
                        editable: _optionsButtonController.editable,
                        helpText: 'Address',
                      ),
                    ),
                    _optionsButtonController.editable
                        ? Padding(
                            padding: const EdgeInsets.only(top: 9),
                            child: EditableResizedFieldWidget(
                              textEditingController:
                                  _projectController.localController,
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
                                  _projectController.postCodeController,
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
                                  _projectController.cityController,
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
                                  _projectController.countryController,
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
                            _projectController.descriptionController,
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
                                _projectController.createProject(
                                  context,
                                  widget.voidCallback,
                                );
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
                          Navigator.of(context).pop(false);
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
