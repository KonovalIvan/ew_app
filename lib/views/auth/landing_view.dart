import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/landing_controller.dart';
import 'package:flutter_svg/svg.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

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
    return Scaffold(
      body: Container(
        decoration: backgroundDecorationGradient,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(
          left: 43.0,
          right: 43.0,
          top: 185.0,
          bottom: 159,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 196.0,
              width: 120.0,
            ),
            Column(
              children: [
                Container(
                  width: 289.0,
                  height: 65.0,
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
                      _landingController.login(context);
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
                      _landingController.register(context);
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
