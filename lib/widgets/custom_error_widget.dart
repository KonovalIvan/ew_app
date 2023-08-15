import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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