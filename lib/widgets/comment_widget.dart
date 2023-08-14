import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../controllers/tasks/comment_controller.dart';
import 'fields/editable_resized_field_widget.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      // height: 100,
      decoration: BoxDecoration(
        color: const Color(0x80C4C4C4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/base_user_profile.png',
              width: 25,
              height: 25,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Widoczne opóźnienia w pracach związanych z montażem stropu. '
                    'Proszę podjąć działania w celu usprawnienia procesu montażu)',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '27.05.2023',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _commentController.showHistory == false
                      ? GestureDetector(
                          onTap: () {
                            print(_commentController.showHistory);
                            setState(() {
                              _commentController.openHistory(context);
                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Transform.rotate(
                              angle: 3.14159,
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                height: 15.0,
                                width: 27.0,
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  _commentController.showHistory == true
                      ? const AddCommentFieldWidget(fieldWidth: double.infinity)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCommentFieldWidget extends StatefulWidget {
  final double? fieldWidth;

  const AddCommentFieldWidget({super.key, this.fieldWidth = 170});

  @override
  // ignore: library_private_types_in_public_api
  _AddCommentFieldWidgetState createState() => _AddCommentFieldWidgetState();
}

class _AddCommentFieldWidgetState extends State<AddCommentFieldWidget> {

  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fieldWidth,
      decoration: BoxDecoration(
        color: const Color(0xFFDFDCE5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Image.asset(
              'assets/images/base_user_profile.png',
              width: 23,
              height: 23,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: EditableResizedFieldWidget(
              editable: true,
              textAlign: TextAlign.start,
              helpText: 'Add comment ...',
              helpTextColor: const Color(0xFF260D67),
              inputTextColor: const Color(0xFF260D67),
              buttonColor: const Color(0x00260D67),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: SvgPicture.asset(
              'assets/icons/send.svg',
              height: 23.0,
              width: 23.0,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
