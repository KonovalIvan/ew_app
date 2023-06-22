import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/widgets.dart';
import 'package:ew_app/controllers/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/controllers/login_controller.dart';

import 'package:flutter_svg/svg.dart';

class RegisterView extends StatefulWidget {
  const RegisterView(RegisterController registerController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController _registerController = RegisterController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool showPassword = false;
  bool isCheckedTermsAndConditions = false;

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Stack(
          children: [
            Container(
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
                    'assets/icons/user.svg',
                    height: 130.0,
                    width: 130.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Create account',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      iconPath: 'assets/icons/user.svg',
                      helpText: 'E-mail',
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      iconPath: 'assets/icons/password.svg',
                      helpText: 'Password',
                      obscureText: !showPassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      iconPath: 'assets/icons/password.svg',
                      helpText: 'Confirm password',
                      obscureText: !showPassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18,
                      left: 2,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Checkbox(
                            value: showPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                showPassword = value ?? true;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            'Show password',
                            style: SafeGoogleFont('Roboto',
                                fontSize: 12.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18,
                      left: 2,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Checkbox(
                            value: isCheckedTermsAndConditions,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedTermsAndConditions = value ?? false;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            'Terms and conditions',
                            style: SafeGoogleFont('Roboto',
                                fontSize: 12.0, color: Colors.white),
                          ),
                        ),
                      ],
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
                        _registerController.register(context);
                      },
                      child: Text(
                        'Sign up',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                          color: buttonRegisterTextColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                            children: const [
                              TextSpan(
                                text: 'Already have an account? ',
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _registerController.login(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              color: textLinkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const BackArrowWidget(),
          ],
        ),
    ),);
  }
}
