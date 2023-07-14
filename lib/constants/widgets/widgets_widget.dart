import 'package:ew_app/constants/sizes.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({
    Key? key,
    this.fieldHeight,
    this.iconPath,
    this.helpText,
    this.obscureText,
    this.mainColor = Colors.white,
  }) : super(key: key);

  final double? fieldHeight;
  final bool? obscureText;
  final String? iconPath;
  final String? helpText;
  final Color mainColor;

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fieldHeight ?? defaultInputFieldSize,
      child: TextField(
        cursorColor: widget.mainColor,
        style: TextStyle(color: widget.mainColor),
        obscureText: widget.obscureText ?? false,
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

class BackArrowWidget extends StatefulWidget {
  const BackArrowWidget({
    Key? key,
    this.fieldHeight = 21,
    this.arrowColor = Colors.white,
    this.fieldWidth = 25,
  }) : super(key: key);

  final double fieldHeight;
  final double fieldWidth;
  final Color arrowColor;

  @override
  // ignore: library_private_types_in_public_api
  _BackArrowWidgetState createState() => _BackArrowWidgetState();
}

class _BackArrowWidgetState extends State<BackArrowWidget> {
  final BackArrowController _backArrowController = BackArrowController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _backArrowController.back(context);
      },
      icon: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    Key? key,
    this.fieldHeight = 16,
    this.fieldWidth = 23,
    this.menuColor = Colors.white,
  }) : super(key: key);

  final double fieldHeight;
  final double fieldWidth;
  final Color menuColor;

  @override
  // ignore: library_private_types_in_public_api
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}

//TODO: transport AppBar and related widgets to other file
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.leftIcon,
    this.rightIconMenu,
    this.title,
  }) : super(key: key);

  final BackArrowWidget? leftIcon;
  final MenuWidget? rightIconMenu;
  final Text? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // ignore: library_private_types_in_public_api
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: widget.title,
      backgroundColor: Colors.transparent,
      leading:
          widget.leftIcon != null ? widget.leftIcon! : const SizedBox(
      width: 0,
      height: 0,
    ),
      actions: [
        widget.rightIconMenu != null
            ? widget.rightIconMenu!
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}

//TODO: transport Error widget to separate file
class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({
    Key? key,
    this.positionTop,
    this.positionLeft,
    this.showErrorIcon = true,
  }) : super(key: key);

  final double? positionTop;
  final double? positionLeft;
  final bool showErrorIcon;

  @override
  // ignore: library_private_types_in_public_api
  _CustomErrorWidgetState createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: widget.positionTop ?? MediaQuery.of(context).size.height / 2,
      top: widget.positionTop ?? MediaQuery.of(context).size.height / 2,
      left: widget.positionLeft ?? MediaQuery.of(context).size.height / 2,
      child: GestureDetector(
        child: Container(
          width: 310.0,
          // height: 30.0,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.showErrorIcon
                  ? SvgPicture.asset(
                      'assets/icons/warning.svg',
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              Padding(
                padding: EdgeInsets.only(left: widget.showErrorIcon ? 10 : 0),
                child: Text(
                  'E-mail or Password is incorrect',
                  style: SafeGoogleFont('Roboto',
                      fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
