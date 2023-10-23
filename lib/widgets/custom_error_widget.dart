import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({
    Key? key,
    this.showErrorIcon = true,
    required this.errorText,
  }) : super(key: key);

  final bool showErrorIcon;
  final String errorText;

  @override
  // ignore: library_private_types_in_public_api
  _CustomErrorWidgetState createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 310.0,
          height: 40.0,
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
                  widget.errorText,
                  style: SafeGoogleFont('Roboto',
                      fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}