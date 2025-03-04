import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/models/gallery_models.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/small_gallery_widget.dart';

import 'package:ew_app/widgets/buttons/main_button_widget.dart';

import 'package:ew_app/controllers/projects/project_controller.dart';

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
  final ProjectController _projectController = ProjectController();
  final ScrollController _scrollController = ScrollController();
  ImagesList imagesList = ImagesList(images: []);

  @override
  void initState() {
    super.initState();
  }

  // TODO: add adding images to not created project in backend
  // void addImage(SingleImage image) {
  //   imagesList.images.add(image);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
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
                          editable: true,
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
                            galleryController: GalleryController(imagesList: imagesList),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController: _projectController
                                      .designerEmailController,
                                  fieldWidth: 164,
                                  editable: true,
                                  helpText: 'Designer email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController:
                                      _projectController.masterEmailController,
                                  fieldWidth: 164,
                                  editable: true,
                                  helpText: 'Master email',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: EditableResizedFieldWidget(
                                  textEditingController:
                                      _projectController.clientPhoneController,
                                  fieldWidth: 164,
                                  editable: true,
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
                        editable: true,
                        helpText: 'Address',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            _projectController.localController,
                        fieldWidth: double.infinity,
                        editable: true,
                        helpText: 'Local',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            _projectController.postCodeController,
                        fieldWidth: double.infinity,
                        editable: true,
                        helpText: 'Post-code',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            _projectController.cityController,
                        fieldWidth: double.infinity,
                        editable: true,
                        helpText: 'City',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            _projectController.countryController,
                        fieldWidth: double.infinity,
                        editable: true,
                        helpText: 'Country',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: EditableResizedFieldWidget(
                        textEditingController:
                            _projectController.descriptionController,
                        fieldWidth: double.infinity,
                        editable: true,
                        helpText: 'Description',
                      ),
                    ),
                    MainButtonWidget(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
