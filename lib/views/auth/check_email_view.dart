import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/controllers/auth/check_email_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckEmailViewState createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  final CheckEmailController _checkEmailController = CheckEmailController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(leftIcon: BackArrowButtonWidget(),),
      body: Container(
        decoration: backgroundDecorationGradient,
        padding: const EdgeInsets.only(
          left: 43.0,
          right: 43.0,
          top: 140.0,
        ),
        height: double.infinity,
        child:
          SingleChildScrollView(
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/email.svg',
                    height: 130.0,
                    width: 130.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Check your email',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 33.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text(
                      'Instructions were send to the provided email address. Please check your mail',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _checkEmailController.showSendAgain == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _checkEmailController.showSendAgain = false;
                              });
                              _checkEmailController.sendAgain(context);
                            },
                            child: const Text(
                              'Send email again',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 26.0),
                          child: Text(
                            'if you still don\'t have an email - check your spam or contact with support',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                ],
              ),
            ),

      ),
    );
  }
}
