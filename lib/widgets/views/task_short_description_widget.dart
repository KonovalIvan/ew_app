import 'package:ew_app/controllers/tasks/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ew_app/constants/styles.dart';

import 'package:ew_app/models/task_models.dart';

class TaskShortDescriptionWidget extends StatefulWidget {
  const TaskShortDescriptionWidget({
    Key? key,
    required this.projectName,
    required this.taskShortInfo,
    required this.deleteTaskFunction,
    required this.updateTaskListFunction,
  }) : super(key: key);

  final String projectName;
  final TaskShortInfo taskShortInfo;
  final Function deleteTaskFunction;
  final Function updateTaskListFunction;

  @override
  // ignore: library_private_types_in_public_api
  _TaskShortDescriptionWidgetState createState() =>
      _TaskShortDescriptionWidgetState();
}

class _TaskShortDescriptionWidgetState
    extends State<TaskShortDescriptionWidget> {
  TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        taskController.openTask(
            context,
            widget.taskShortInfo.id,
            taskController,
            widget.deleteTaskFunction,
            widget.updateTaskListFunction);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6, top: 6),
              child: SvgPicture.asset(
                widget.taskShortInfo.finished == true
                    ? 'assets/icons/done.svg'
                    : 'assets/icons/accept_ring.svg',
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.taskShortInfo.name,
                    style: SafeGoogleFont('Poppins',
                        fontSize: 20.0,
                        color: widget.taskShortInfo.finished
                            ? const Color(0x80FFFFFF)
                            : Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: widget.taskShortInfo.finished
                            ? TextDecoration.lineThrough
                            : null,
                        decorationThickness: 2.0),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.projectName,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 15.0,
                            color: const Color(0x70FFFFFF),
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            width: 15,
                            height: 15,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            widget.taskShortInfo.updateDate,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 15.0,
                              color: const Color(0x70FFFFFF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
