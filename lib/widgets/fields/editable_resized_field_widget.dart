import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class EditableResizedFieldWidget extends StatefulWidget {
  final bool editable;
  final String? helpText;
  final double? helpTextSize;
  final double? inputTextSize;
  final double? fieldWidth;
  final String? initialText;
  final Color? buttonColor;
  final Color? inputTextColor;
  final Color? helpTextColor;
  final String? mainText;

  final TextAlign? textAlign;

  const EditableResizedFieldWidget({
    Key? key,
    required this.editable,
    this.helpText,
    this.initialText,
    this.helpTextSize = 12,
    this.inputTextSize = 12,
    this.helpTextColor = const Color(0xFFFFFFFF),
    this.inputTextColor = const Color(0xFFFFFFFF),
    this.buttonColor = const Color(0x50C4C4C4),
    this.fieldWidth = 170,
    this.textAlign,
    this.mainText,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditableResizedFieldWidgetState createState() =>
      _EditableResizedFieldWidgetState();
}

class _EditableResizedFieldWidgetState extends State<EditableResizedFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateTextFieldText();
  }

  @override
  void didUpdateWidget(covariant EditableResizedFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialText != widget.initialText || oldWidget.editable != widget.editable) {
      updateTextFieldText();
    }
  }

  void updateTextFieldText() {
    if (widget.editable) {
      _textEditingController.text = widget.initialText ?? '';
    } else {
      _textEditingController.text = widget.initialText ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.editable,
      child: Container(
        width: widget.fieldWidth,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AutoSizeTextField(
          textAlign: widget.textAlign ?? TextAlign.center,
          controller: _textEditingController,
          fullwidth: true,
          maxLines: null,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: widget.inputTextSize,
            color: widget.inputTextColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.helpText,
            hintStyle: TextStyle(
              fontSize: widget.helpTextSize,
              color: widget.helpTextColor,
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
