import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class ProjectInputFieldWidget extends StatefulWidget {
  TextEditingController textEditingController;
  bool editable;
  String? helpText;
  String? initialText;

  ProjectInputFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.editable,
    this.helpText,
    this.initialText,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectInputFieldWidgetState createState() =>
      _ProjectInputFieldWidgetState();
}

class _ProjectInputFieldWidgetState extends State<ProjectInputFieldWidget> {

  @override
  void initState() {
    super.initState();
    // set first text in field
    widget.initialText != null ?
    widget.textEditingController.text = widget.initialText! : null;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.editable,
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: const Color(0x50C4C4C4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AutoSizeTextField(
          textAlign: TextAlign.center,
          controller: widget.textEditingController,
          fullwidth: true,
          maxLines: null,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 12,
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.helpText,
            hintStyle: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
          ),
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }
}
