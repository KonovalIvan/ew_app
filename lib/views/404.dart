import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/sizes.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/404_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView(NotFoundController notFoundController, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotFoundViewState createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  final NotFoundController _notFoundController = NotFoundController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundDecorationGradient,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '404',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 11.0,
                  ),
                  child: Text(
                    'Page not found',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: backMarginTop,
            left: backMarginLeft,
            child: GestureDetector(
              onTap: () {
                _notFoundController.back(context);
              },
              child: Container(
                width: 40,
                height: 40,
                color: Colors.transparent,
                child: SvgPicture.asset(
                  'assets/icons/back.svg',
                  height: 25.0,
                  width: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
