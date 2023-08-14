import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionsButtonWidget extends StatefulWidget {
  OptionsButtonWidget({
    Key? key,
    this.fieldHeight = 19,
    this.fieldWidth = 5,
  }) : super(key: key);

  final double fieldHeight;
  final double fieldWidth;

  @override
  // ignore: library_private_types_in_public_api
  _OptionsButtonWidgetState createState() => _OptionsButtonWidgetState();
}

class _OptionsButtonWidgetState extends State<OptionsButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return
            SizedBox(
              width: widget.fieldWidth,
              height: widget.fieldHeight,
              child: SvgPicture.asset(
                'assets/icons/options.svg',
                fit: BoxFit.fill,
              ),
        );
      },
    );
  }
}
