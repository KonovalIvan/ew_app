import 'dart:async';

import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class AlmostDoneView extends StatefulWidget {
  const AlmostDoneView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlmostDoneState createState() => _AlmostDoneState();
}

class _AlmostDoneState extends State<AlmostDoneView> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/additional_information');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      decoration: backgroundDecorationGradient,
      padding: const EdgeInsets.only(
        left: 43.0,
        right: 43.0,
        top: 140.0,
      ),
      height: double.infinity,
      child:
          SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/done.svg',
                    height: 130.0,
                    width: 130.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'It’s almost done',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Text(
                      'Please complete the information in next step',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
