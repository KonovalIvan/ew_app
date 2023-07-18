import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserCardWidgetState createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: add background from const
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xFF260D67),
            Color(0xFF572886),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(54, 12, 167, 0.4),
            blurRadius: 40,
            offset: Offset(5, 5),
          ),
        ],
      ),
      width: double.infinity,
      height: 360.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                '17',
              ),
              Text(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                'projects',
              ),
            ],
          ),
          SizedBox(
            width: 185.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 22, top: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 2.0),
                  ),
                  // TODO: add progress bar
                  child: Image.asset(
                    'assets/images/base_user_profile.png',
                  ),
                ),
                Text(
                  'Admin',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      'knbgjkkmk@gmail.com'),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                '62%',
              ),
              Text(
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                'progress',
              ),
            ],
          )
        ],
      ),
    );
  }
}
