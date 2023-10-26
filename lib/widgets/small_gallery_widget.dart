import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SmallGalleryWidget extends StatefulWidget {
  const SmallGalleryWidget({
    Key? key,
    this.imagePath = const [],
  }) : super(key: key);

  final List<String> imagePath;

  @override
  // ignore: library_private_types_in_public_api
  _SmallGalleryWidgetState createState() => _SmallGalleryWidgetState();
}

class _SmallGalleryWidgetState extends State<SmallGalleryWidget> {
  late bool defaultImage = false;

  @override
  void initState() {
    super.initState();
    if (widget.imagePath.isEmpty) {
      defaultImage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: const EdgeInsets.only(
          right: 10,
        ),
        child: defaultImage
            ? Center(child: Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 2.0),
                  child: Image.asset(
                    'assets/images/base_project.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),)
            : ClipRRect(
                child: Align(
                  child: Swiper(
                    itemWidth: 100,
                    itemHeight: 100,
                    loop: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // TODO: add this push to controller!
                          Navigator.pushNamed(context, '/gallery');
                        },
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.imagePath[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width / 2.0),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.imagePath.length,
                    layout: SwiperLayout.STACK,
                  ),
                ),
              ));
  }
}
