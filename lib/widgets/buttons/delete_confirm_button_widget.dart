import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';

class DeleteConfirmButtonWidget extends StatefulWidget {
  final VoidCallback onPressedNo;
  final VoidCallback onPressedYes;
  final double? positionTop;

  const DeleteConfirmButtonWidget(
      {super.key,
      required this.onPressedNo,
      required this.onPressedYes,
      this.positionTop = 0});

  @override
  // ignore: library_private_types_in_public_api
  _DeleteConfirmButtonWidgetState createState() =>
      _DeleteConfirmButtonWidgetState();
}

class _DeleteConfirmButtonWidgetState extends State<DeleteConfirmButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.positionTop! + 400,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 325,
          height: 97,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text(
                  'Are you sure you want to delete?',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17, right: 17, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 59,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE45151),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          widget.onPressedNo();
                        },
                        child: Text(
                          'No',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 59,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFF30D37B),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          widget.onPressedYes();
                        },
                        child: Text(
                          'Yes',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
