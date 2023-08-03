import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';

class SmallGalleryWidget extends StatefulWidget {
  const SmallGalleryWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SmallGalleryWidgetState createState() => _SmallGalleryWidgetState();
}

class _SmallGalleryWidgetState extends State<SmallGalleryWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: Create swiper
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width / 2.0,
          ),
          child: Image.asset(
            'assets/images/base_project.jpg',
            width: 100,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 2.0,
                ),
                child: Container(
                  color: const Color(0xFFD9D9D9),
                  width: 10,
                  height: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width / 2.0,
                  ),
                  child: Container(
                    color: const Color(0x50D9D9D9),
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 2.0,
                ),
                child: Container(
                  color: const Color(0x50D9D9D9),
                  width: 10,
                  height: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
