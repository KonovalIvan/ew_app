import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
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
  _MenuButtonWidgetState createState() => _MenuButtonWidgetState();
}

class _MenuButtonWidgetState extends State<MenuButtonWidget> {
  final MenuButtonController _menuButtonController = MenuButtonController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _menuButtonController.open(context);
      },
      icon: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
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
