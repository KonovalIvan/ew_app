import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/sizes.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/widgets/widgets.dart';
import 'package:ew_app/controllers/coming_soon_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComingSoonView extends StatefulWidget {
  const ComingSoonView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComingSoonViewState createState() => _ComingSoonViewState();
}

class _ComingSoonViewState extends State<ComingSoonView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
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
                  'Coming soon',
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
                    'We are working for this for you',
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
        ],
      ),
    );
  }
}
