import 'package:flutter/material.dart';
import 'package:ew_app/styles.dart';

import 'package:ew_app/controllers/landing_controller.dart';

class LandingView extends StatefulWidget {
  const LandingView(LandingController landingController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final LandingController _landingController = LandingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(43*fem, 185*fem, 43*fem, 159*fem),
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
              margin: EdgeInsets.fromLTRB(0.13*fem, 0*fem, 0*fem, 113.25*fem),
              width: 119.13*fem,
              height: 195.75*fem,
              child: Image.asset(
                'assets/views/landing_view/images/logo.png',
                width: 119.13*fem,
                height: 195.75*fem,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29*fem),
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
                child: Text(
                  'Sign in',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 33*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5*ffem/fem,
                    color: const Color(0xd6260975),
                  ),
                ),
              ),
            ),
            Container(
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
                      _landingController.login(context);
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
          ],
        ),
      ),
    );
  }
}