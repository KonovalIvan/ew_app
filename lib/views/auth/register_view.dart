import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/controllers/auth/register_controller.dart';
import 'package:ew_app/widgets/fields/auth_input_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController _registerController = RegisterController();
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
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
      ),
      body: Container(
        decoration: backgroundDecorationGradient,
        padding: const EdgeInsets.only(
          left: 43.0,
          right: 43.0,
          top: 140.0,
        ),
        height: double.infinity,
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Create account',
                  style: SafeGoogleFont('Poppins',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: AuthInputFieldWidget(
                  fieldHeight: 33,
                  iconPath: 'assets/icons/user.svg',
                  helpText: 'E-mail',
                  onChanged: (value) {
                    _registerController.email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: AuthInputFieldWidget(
                  fieldHeight: 33,
                  iconPath: 'assets/icons/password.svg',
                  helpText: 'Password',
                  obscureText: !_registerController.showPassword,
                  onChanged: (value) {
                    _registerController.password = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: AuthInputFieldWidget(
                  fieldHeight: 33,
                  iconPath: 'assets/icons/password.svg',
                  helpText: 'Confirm password',
                  obscureText: !_registerController.showPassword,
                  onChanged: (value) {
                    _registerController.confirmPassword = value;
                  },
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
                        value: _registerController.showPassword,
                        onChanged: (bool? value) {
                          setState(() {
                            _registerController.showPassword =
                                !_registerController.showPassword;
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
                        value: _registerController.isCheckedTermsAndConditions,
                        onChanged: (bool? value) {
                          setState(() {
                            _registerController.isCheckedTermsAndConditions =
                                !_registerController
                                    .isCheckedTermsAndConditions;
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
                padding: const EdgeInsets.only(top: 17.0),
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
      ),
    );
  }
}
