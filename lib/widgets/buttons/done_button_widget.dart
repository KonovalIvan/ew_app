import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoneButtonWidget extends StatefulWidget {
  final double paddingTop;
  final double paddingBottom;
  final VoidCallback onPressedDone;

  const DoneButtonWidget(
      {super.key, this.paddingTop = 32, this.paddingBottom = 30, required this.onPressedDone});

  @override
  // ignore: library_private_types_in_public_api
  _DoneButtonWidgetState createState() => _DoneButtonWidgetState();
}

class _DoneButtonWidgetState extends State<DoneButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: widget.paddingTop, bottom: widget.paddingBottom),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF37E888),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 2.0),
        ),
        child: TextButton(
          onPressed: () {
            widget.onPressedDone();
          },
          child: SvgPicture.asset(
            'assets/icons/done.svg',
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
