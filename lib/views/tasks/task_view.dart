import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/models/gallery_models.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/add_comment_field_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:ew_app/widgets/task_gallery_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/options_button_widget.dart';

import 'package:ew_app/controllers/tasks/task_controller.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';
import 'package:ew_app/widgets/comment_widget.dart';

class TaskView extends StatefulWidget {
  final TaskController taskController;

  const TaskView({
    Key? key,
    required this.taskController,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();
  final ScrollController _scrollController = ScrollController();

  void updateVisibleStatusList(String status) {
    setState(() {
      widget.taskController.updateVisibleStatusList(status: status);
    });
  }

  void updateImageList(SingleImage singleImage) {
    SingleImageShortInfo singleImageShortInfo =
        SingleImageShortInfo(id: singleImage.id, image: singleImage.image);
    widget.taskController.taskFullInfo.gallery!.images
        .add(singleImageShortInfo);
    updateView();
  }

  void updateView() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.taskController.taskFullInfo;
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
        decoration: backgroundDecorationGradient,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 14.0,
                    right: 14.0,
                    top: 100.0,
                  ),
                  child: Column(
                    children: [
                      EditableResizedFieldWidget(
                        textEditingController:
                            widget.taskController.nameController,
                        editable: _optionsButtonController.editable,
                        initialText: task.name,
                        helpText: 'Task name',
                        helpTextSize: 20,
                        inputTextSize: 20,
                        buttonColor: const Color(0x00FFFFFF),
                        fieldWidth: 330,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: EditableResizedFieldWidget(
                          textEditingController:
                              widget.taskController.descriptionController,
                          editable: _optionsButtonController.editable,
                          helpText: 'Description',
                          helpTextSize: 15,
                          inputTextSize: 15,
                          helpTextColor: const Color(0xFF000000),
                          inputTextColor: const Color(0xFF000000),
                          buttonColor: const Color(0xFFDFDCE5),
                          fieldWidth: 330,
                          initialText: task.description,
                        ),
                      ),
                      // TODO: change open single image after tap on image to open gallery
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: TaskGalleryWidget(
                          galleryElements:
                              widget.taskController.taskFullInfo.gallery,
                          updateImagesList: updateImageList,
                          projectId:
                              widget.taskController.taskFullInfo.projectId,
                          taskId: widget.taskController.taskFullInfo.id,
                        ),
                      ),
                      if (task.comments != null)
                        for (var comment in task.comments!)
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: CommentWidget(
                              comment: comment,
                              updateTaskView: updateView,
                              sendComment: widget.taskController.sendComment,
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: AddCommentFieldWidget(
                          fieldWidth: 312,
                          updateTaskView: updateView,
                          sendComment: widget.taskController.sendComment,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        width: 312,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.taskController.visibleStatusList == false
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.taskController
                                            .updateVisibleStatusList();
                                      });
                                    },
                                    child: taskStatusView(
                                        widget.taskController.taskStatus),
                                  )
                                : taskStatusListView(updateVisibleStatusList),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Created at ${widget.taskController.taskFullInfo.createDate}',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 13.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      _optionsButtonController.editable
                          ? MainButtonWidget(
                              buttonColor: const Color(0x9037E888),
                              pathToSvg: 'assets/icons/done.svg',
                              onPressed: () async {
                                widget.taskController.updateTaskView = true;
                                _optionsButtonController.editable =
                                    await widget.taskController.updateTask();
                                setState(() {
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
              ),
              _optionsButtonController.visibleOptionsMenu
                  ? Positioned.fill(
                      child: Container(
                        color: const Color(0x70000000),
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )
                  : Container(),
              // TODO: set this menus in middle of screen, not view.
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
                        setState(
                          () {
                            _optionsButtonController.pressNoDelete();
                          },
                        );
                      },
                      onPressedYes: () {
                        setState(
                          () {
                            _optionsButtonController.pressYesDelete(
                                context,
                                apiTaskDeleteUrl,
                                widget.taskController.taskFullInfo.id);
                          },
                        );
                      },
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget taskStatusView(String status) {
  Color color;
  String text;

  if (status == 'In progress') {
    color = const Color(0x80EAB364);
    text = 'In progress';
  } else if (status == 'Done') {
    color = const Color(0x8037E888);
    text = 'Done';
  } else if (status == 'Ready') {
    color = const Color(0x80FBFDFF);
    text = 'Ready';
  } else {
    color = const Color(0x80E45151);
    text = 'Unknown';
  }

  return Container(
    width: 130,
    height: 32,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      color: color,
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: SafeGoogleFont(
        'Poppins',
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget taskStatusListView(Function(String) voidCallback) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          voidCallback('Done');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('Done'),
        ),
      ),
      GestureDetector(
        onTap: () {
          voidCallback('In progress');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('In progress'),
        ),
      ),
      GestureDetector(
        onTap: () {
          voidCallback('Ready');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('Ready'),
        ),
      ),
    ],
  );
}
