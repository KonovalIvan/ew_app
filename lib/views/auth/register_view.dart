import 'package:flutter/material.dart';
import 'package:ew_app/constants/styles.dart';

import 'package:ew_app/controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView(RegisterController registerController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(30*fem, 157*fem, 27.99*fem, 126*fem),
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
              margin: EdgeInsets.fromLTRB(93*fem, 0*fem, 94.01*fem, 20*fem),
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
                      'assets/views/register_view/images/vector-head.png',
                      width: 43.33*fem,
                      height: 43.33*fem,
                    ),
                  ),
                  SizedBox(
                    width: 86.67*fem,
                    height: 32.5*fem,
                    child: Image.asset(
                      'assets/views/register_view/images/vector-body.png',
                      width: 86.67*fem,
                      height: 32.5*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.01*fem, 95*fem),
              child: Text(
                'Create account',
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
              margin: EdgeInsets.fromLTRB(13*fem, 0*fem, 0*fem, 46*fem),
              width: 304.01*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    height: 30*fem,
                    child: SizedBox(
                      width: 73.12*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.12*fem, 0*fem),
                            width: 20*fem,
                            height: 20*fem,
                            child: Image.asset(
                              'assets/views/register_view/images/icons-login.png',
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
                              'assets/views/register_view/images/icons-password.png',
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
              margin: EdgeInsets.fromLTRB(13*fem, 0*fem, 15.01*fem, 18*fem),
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
                      _registerController.login(context);
                    });
                  },
                child: Text(
                  'Sign up',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 33*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5*ffem/fem,
                    color: const Color(0xd8097541),
                  ),
                ),
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.01*fem, 0*fem),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Roboto',
                    fontSize: 12*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.1725*ffem/fem,
                    color: const Color(0xff6c7b79),
                  ),
                  children: [
                    TextSpan(
                      text: 'Already have a account?',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'Login',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
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