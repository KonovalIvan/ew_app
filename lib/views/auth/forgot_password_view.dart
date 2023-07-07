import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/widgets/widgets.dart';
import 'package:ew_app/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView(ForgotPasswordController forgotPasswordController,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: backgroundDecorationGradient,
              padding: const EdgeInsets.only(
                left: 43.0,
                right: 43.0,
                top: 140.0,
              ),
              child: Column(
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
                      'Forgot password',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      iconPath: 'assets/icons/user.svg',
                      helpText: 'E-mail',
                      obscureText: true,
                    ),
                  ),
                  Container(
                    width: 289.0,
                    height: 65.0,
                    margin: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: buttonGreyColor,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2.0),
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
                        _forgotPasswordController.sendEmail(context);
                      },
                      child: Text(
                        'Send password',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                          color: buttonSendEmailTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
