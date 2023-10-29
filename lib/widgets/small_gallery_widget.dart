import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/models/gallery_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:ew_app/constants/url.dart';

class SmallGalleryWidget extends StatefulWidget {
  const SmallGalleryWidget({
    Key? key,
    this.imagesList,
    required this.galleryController,
  }) : super(key: key);

  final ImagesList? imagesList;
  final GalleryController galleryController;

  @override
  // ignore: library_private_types_in_public_api
  _SmallGalleryWidgetState createState() => _SmallGalleryWidgetState();
}

class _SmallGalleryWidgetState extends State<SmallGalleryWidget> {
  late bool defaultImage = false;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    if (widget.imagesList == null || widget.imagesList!.images.isEmpty) {
      defaultImage = true;
    } else {
      widget.galleryController.imagesList = widget.imagesList!;
      widget.galleryController.galleryElementsCount =
          widget.imagesList!.images.length;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      child: defaultImage
          ? Center(
              child: SizedBox(
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
              ),
            )
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
                        widget.galleryController.imageIndex = index;
                        widget.galleryController
                            .openMainGallery(context, widget.galleryController, initializeData);
                      },
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '$baseUrl${widget.galleryController.imagesList.images[index].image}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 2.0),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.galleryController.imagesList.images.length,
                  layout: SwiperLayout.STACK,
                ),
              ),
            ),
    );
  }
}
