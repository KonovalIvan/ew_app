import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/sizes.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget({
    Key? key,
    this.buttonColor,
    this.textColor = buttonGreyColor,
    this.fontSize = 20, this.buttonText = '',
  }) : super(key: key);

  final Color? buttonColor;
  final String buttonText;
  final Color textColor;
  final double fontSize;

  @override
// ignore: library_private_types_in_public_api
  _HomeButtonWidgetState createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 68.0,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(23),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            // _loginController.login(context);
          });
        },
        child: Text(
          widget.buttonText,
          style: SafeGoogleFont(
            'Poppins',
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w600,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
