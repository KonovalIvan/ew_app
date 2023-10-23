import 'package:ew_app/constants/sizes.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthInputFieldWidget extends StatefulWidget {
  const AuthInputFieldWidget({
    Key? key,
    this.fieldHeight,
    this.iconPath,
    this.helpText,
    this.obscureText,
    this.mainColor = Colors.white,
    this.onChanged,
  }) : super(key: key);

  final double? fieldHeight;
  final bool? obscureText;
  final String? iconPath;
  final String? helpText;
  final Color mainColor;
  final void Function(String)? onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _AuthInputFieldWidgetState createState() => _AuthInputFieldWidgetState();
}

class _AuthInputFieldWidgetState extends State<AuthInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fieldHeight ?? defaultInputFieldSize,
      child: TextField(
        cursorColor: widget.mainColor,
        style: TextStyle(color: widget.mainColor),
        obscureText: widget.obscureText ?? false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.mainColor),
          ),
          hintText: widget.helpText,
          fillColor: const Color.fromRGBO(0, 0, 0, 0),
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.mainColor, width: 2),
          ),
          hintStyle: SafeGoogleFont(
            'Roboto',
            color: widget.mainColor,
            fontWeight: FontWeight.normal,
            fontSize: 15.0,
          ),
          prefixIcon: widget.iconPath != null
              ? Padding(
            padding: const EdgeInsets.only(right: 11, bottom: 6, top: 4),
            child: SvgPicture.asset(
              widget.iconPath ?? '',
              height: 20,
              width: 20,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
