import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainButtonWidget extends StatefulWidget {
  final double paddingTop;
  final double paddingBottom;
  final String? pathToSvg;
  final String? buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const MainButtonWidget(
      {super.key,
      this.paddingTop = 32,
      this.paddingBottom = 30,
      required this.onPressed,
      this.pathToSvg,
      this.buttonText,
      required this.buttonColor});

  @override
  // ignore: library_private_types_in_public_api
  _MainButtonWidgetState createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget> {
  Widget setButtonContext() {
    if (widget.pathToSvg != null) {
      return SvgPicture.asset(
        widget.pathToSvg ?? '',
        width: 24,
        height: 24,
        fit: BoxFit.fill,
      );
    } else if (widget.buttonText != null) {
      return Text(
        widget.buttonText ?? '',
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 20,
          color: Colors.white,
        ),
      );
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: widget.paddingTop, bottom: widget.paddingBottom),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 2.0),
        ),
        child: TextButton(
            onPressed: () {
              widget.onPressed();
            },
            child: setButtonContext()),
      ),
    );
  }
}
