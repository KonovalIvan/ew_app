import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/tasks/task_controller.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';
import 'package:ew_app/widgets/task_gallery_widget.dart';
import 'package:image_picker/image_picker.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({Key? key, required this.dashboardId}) : super(key: key);

  final String dashboardId;

  @override
  // ignore: library_private_types_in_public_api
  _NewTaskViewState createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();
  final TaskController _taskController = TaskController();
  final ScrollController _scrollController = ScrollController();

  List<XFile> imageList = [];

  void updateImageList(XFile xFile) {
    imageList.add(xFile);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
      ),
      body: Container(
        decoration: backgroundDecorationGradient,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: 100.0,
            ),
            child: Column(
              children: [
                EditableResizedFieldWidget(
                  editable: true,
                  textEditingController:
                  _taskController.nameController,
                  helpText: 'Task name',
                  helpTextSize: 20,
                  inputTextSize: 20,
                  buttonColor: const Color(0x00FFFFFF),
                  fieldWidth: 330,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: EditableResizedFieldWidget(
                    editable: true,
                    textEditingController:
                    _taskController.descriptionController,
                    helpText: 'Description',
                    helpTextSize: 15,
                    inputTextSize: 15,
                    helpTextColor: const Color(0xFF000000),
                    inputTextColor: const Color(0xFF000000),
                    buttonColor: const Color(0xFFDFDCE5),
                    fieldWidth: 330,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 1),
                //   child: TaskGalleryWidget(galleryCountElements: imageList.length, updateImagesList: updateImageList,),
                // ),
                MainButtonWidget(
                  buttonColor: const Color(0x9037E888),
                  pathToSvg: 'assets/icons/done.svg',
                  onPressed: () {
                    _taskController.createTask(
                      context,
                      widget.dashboardId,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
