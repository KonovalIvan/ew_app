import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatefulWidget {
  final VoidCallback? onPressedEdit;
  final VoidCallback onPressedDelete;
  final double? positionTop;
  final double? heightElement;

  const OptionsWidget(
      {super.key,
      this.onPressedEdit,
      required this.onPressedDelete,
      this.positionTop = 0, this.heightElement = 77});

  @override
  // ignore: library_private_types_in_public_api
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: add background filter
    return Positioned(
      top: widget.positionTop! + 100,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.0),
            bottomLeft: Radius.circular(23.0),
          ),
          color: Colors.white,
        ),
        width: 157,
        height: widget.heightElement,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.onPressedEdit != null
                ? SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onPressedEdit!();
                      },
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(const Size(20, 20)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: Text(
                        'Edit',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF572886),
                        ),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  widget.onPressedDelete();
                },
                style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(20, 20)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Text(
                  'Delete',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF572886),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
