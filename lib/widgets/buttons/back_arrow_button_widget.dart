import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackArrowButtonWidget extends StatefulWidget {
  const BackArrowButtonWidget({
    Key? key,
    this.fieldHeight = 21,
    this.arrowColor = Colors.white,
    this.fieldWidth = 25,
    this.update = false,
  }) : super(key: key);

  final double fieldHeight;
  final double fieldWidth;
  final Color arrowColor;
  final Object update;

  @override
  // ignore: library_private_types_in_public_api
  _BackArrowButtonWidgetState createState() => _BackArrowButtonWidgetState();
}

class _BackArrowButtonWidgetState extends State<BackArrowButtonWidget> {
  final BackArrowButtonController _backArrowButtonController = BackArrowButtonController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _backArrowButtonController.back(context, widget.update);
      },
      icon: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              fit: BoxFit.fill,
              color: widget.arrowColor,
            ),
          );
        },
      ),
    );
  }
}
