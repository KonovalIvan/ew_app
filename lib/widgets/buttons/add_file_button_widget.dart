import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddFileButtonWidget extends StatefulWidget {
  const AddFileButtonWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddFileButtonWidgetState createState() => _AddFileButtonWidgetState();
}

class _AddFileButtonWidgetState extends State<AddFileButtonWidget> {
  final BackArrowButtonController _backArrowButtonController =
      BackArrowButtonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0x50C4C4C4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Tap to add Files',
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
