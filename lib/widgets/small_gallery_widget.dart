import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SmallGalleryWidget extends StatefulWidget {
  const SmallGalleryWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SmallGalleryWidgetState createState() => _SmallGalleryWidgetState();
}

class _SmallGalleryWidgetState extends State<SmallGalleryWidget> {
  List imagepath = [
    'assets/images/base_project.jpg',
    'assets/images/base_project.jpg',
    'assets/images/base_project.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Create swiper
    return Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        child: ClipRRect(
          child: Align(
            child: Swiper(
              itemWidth: 100,
              itemHeight: 100,
              loop: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imagepath[index])),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2.0),
                  ),
                );
              },
              itemCount: imagepath.length,
              layout: SwiperLayout.STACK,
            ),
          ),
        ),
    );
  }
}
