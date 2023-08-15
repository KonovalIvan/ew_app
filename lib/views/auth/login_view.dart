import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/custom_error_widget.dart';
import 'package:ew_app/widgets/fields/auth_input_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:ew_app/controllers/auth/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();
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
                  'Welcome back',
                  style: SafeGoogleFont('Poppins',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _loginController.showError
                    ? const CustomErrorWidget()
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _loginController.showError ? 10.0 : 50.0),
                child: const AuthInputFieldWidget(
                  fieldHeight: 33,
                  iconPath: 'assets/icons/user.svg',
                  helpText: 'E-mail',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: AuthInputFieldWidget(
                  fieldHeight: 33,
                  iconPath: 'assets/icons/password.svg',
                  helpText: 'Password',
                  obscureText: !_loginController.showPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Checkbox(
                            value: _loginController.showPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                _loginController.showPassword = value ?? false;
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
                    SizedBox(
                      height: 14,
                      child: TextButton(
                        onPressed: () {
                          _loginController.forgotPassword(context);
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero,
                          ),
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
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
                      _loginController.login(context);

                  },
                  child: Text(
                    'Sign in',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 33,
                      fontWeight: FontWeight.w400,
                      color: buttonLoginTextColor,
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
                            text: 'Don’t have account? ',
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _loginController.register(context);
                      },
                      child: const Text(
                        'Create a new account!',
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
