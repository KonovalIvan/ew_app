import 'package:flutter/material.dart';
import 'package:ew_app/controllers/login_controller.dart';

import 'package:ew_app/constants/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView(LoginController loginController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    _loginController.emailController = TextEditingController();
    _loginController.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(33*fem, 157*fem, 29.5*fem, 125*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: const Color(0xffffffff),
          gradient: const LinearGradient (
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
            colors: <Color>[Color(0xff572885), Color(0xff250d67)],
            stops: <double>[0, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x66360ca7),
              offset: Offset(5*fem, 5*fem),
              blurRadius: 20*fem,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(90*fem, 0*fem, 92.5*fem, 20*fem),
              padding: EdgeInsets.fromLTRB(21.67*fem, 16.25*fem, 21.67*fem, 16.25*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xffffffff)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21.67*fem),
                    width: 43.33*fem,
                    height: 43.33*fem,
                    child: Image.asset(
                      'assets/views/login_view/images/vector-head.png',
                      width: 43.33*fem,
                      height: 43.33*fem,
                    ),
                  ),
                  SizedBox(
                    width: 86.67*fem,
                    height: 32.5*fem,
                    child: Image.asset(
                      'assets/views/login_view/images/vector-body.png',
                      width: 86.67*fem,
                      height: 32.5*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.5*fem, 24*fem),
              child: Text(
                'Welcome back',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 40*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5*ffem/fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67.5*fem, 34*fem),
              padding: EdgeInsets.fromLTRB(1.87*fem, 3.52*fem, 0*fem, 3.52*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.87*fem, 0*fem),
                    width: 26.25*fem,
                    height: 22.97*fem,
                    child: Image.asset(
                      'assets/views/login_view/images/warning.png',
                      width: 26.25*fem,
                      height: 22.97*fem,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                    child: Text(
                      'E-mail or Password is incorrect',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 3.49*fem, 6*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    height: 30*fem,
                    child: SizedBox(
                      width: 201.12*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.12*fem, 0*fem),
                            width: 20*fem,
                            height: 20*fem,
                            child: Image.asset(
                              'assets/views/login_view/images/icons-login.png',
                              width: 20*fem,
                              height: 20*fem,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.35*fem),
                            child: Text(
                              'E-mail',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1725*ffem/fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3.75*fem, 1.65*fem, 3.75*fem, 1.65*fem),
                    width: double.infinity,
                    height: 30*fem,
                    child: SizedBox(
                      width: 94.37*fem,
                      height: 18*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0.22*fem, 14.87*fem, 0*fem),
                            width: 12.5*fem,
                            height: 16.88*fem,
                            child: Image.asset(
                              'assets/views/login_view/images/icons-password.png',
                              width: 12.5*fem,
                              height: 16.88*fem,
                            ),
                          ),
                          Text(
                            'Password',
                            style: SafeGoogleFont (
                              'Roboto',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(215.5*fem, 0*fem, 0*fem, 18*fem),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Roboto',
                    fontSize: 12*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.1725*ffem/fem,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'Forgot Password?',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 13.5*fem, 18*fem),
              width: double.infinity,
              height: 65*fem,
              decoration: BoxDecoration (
                color: const Color(0xfffffafa),
                borderRadius: BorderRadius.circular(40*fem),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _loginController.login(context);
                    });
                  },
                child: Text(
                  'Sign in',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 33*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5*ffem/fem,
                    color: const Color(0xff260874),
                  ),
                ),
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(11.5*fem, 0*fem, 0*fem, 0*fem),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Roboto',
                    fontSize: 12*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.171875*ffem/fem,
                    color: const Color(0xff6c7b79),
                  ),
                  children: [
                    TextSpan(
                      text: 'Don’t have account?',
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2575*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2575*ffem/fem,
                        color: const Color(0xff6c7b79),
                      ),
                    ),
                    TextSpan(
                      text: 'create a new account!',
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2575*ffem/fem,
                        color: const Color(0xff3ca8ca),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
