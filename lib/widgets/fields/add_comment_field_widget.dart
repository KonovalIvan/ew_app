import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ew_app/controllers/tasks/comment_controller.dart';


class AddCommentFieldWidget extends StatefulWidget {
  final double? fieldWidth;

  const AddCommentFieldWidget({super.key, this.fieldWidth = 170});

  @override
  // ignore: library_private_types_in_public_api
  _AddCommentFieldWidgetState createState() => _AddCommentFieldWidgetState();
}

class _AddCommentFieldWidgetState extends State<AddCommentFieldWidget> {

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
          const Expanded(
            child: EditableResizedFieldWidget(
              editable: true,
              textAlign: TextAlign.start,
              helpText: 'Add comment ...',
              helpTextColor: Color(0xFF260D67),
              inputTextColor: Color(0xFF260D67),
              buttonColor: Color(0x00260D67),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
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
