import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ew_app/constants/styles.dart';

class TaskShortDescriptionWidget extends StatefulWidget {
  const TaskShortDescriptionWidget(
      {Key? key,
        required this.done,
        required this.taskName,
        required this.projectName,
        required this.lastActivity, required this.onPressed})
      : super(key: key);

  final String taskName;
  final String projectName;
  final String lastActivity;
  final VoidCallback onPressed;
  final bool done;


  @override
  // ignore: library_private_types_in_public_api
  _TaskShortDescriptionWidgetState createState() =>
      _TaskShortDescriptionWidgetState();
}

class _TaskShortDescriptionWidgetState
    extends State<TaskShortDescriptionWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6, top: 6),
              child: SvgPicture.asset(
                widget.done == true
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
                    widget.taskName,
                    style: SafeGoogleFont('Poppins',
                        fontSize: 20.0,
                        color: widget.done ? const Color(0x80FFFFFF) : Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration:
                        widget.done ? TextDecoration.lineThrough : null,
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
                            widget.lastActivity,
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