import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskGalleryWidget extends StatefulWidget {
  final int galleryCountElements;
  final Function updateImagesList;

  const TaskGalleryWidget({super.key, required this.galleryCountElements, required this.updateImagesList});

  @override
  // ignore: library_private_types_in_public_api
  _TaskGalleryWidgetState createState() => _TaskGalleryWidgetState();
}

class _TaskGalleryWidgetState extends State<TaskGalleryWidget> {
  bool _showAllContainers = false;

  @override
  Widget build(BuildContext context) {
    final itemCount = _showAllContainers
        ? widget.galleryCountElements + 1
        : widget.galleryCountElements >= 4
            ? 4
            : widget.galleryCountElements + 1;

    return Container(
      width: 313,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFDFDCE5),
        borderRadius: BorderRadius.circular(39),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (index == itemCount - 1) {
                  if (!_showAllContainers) {
                    if (index == 3) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showAllContainers = true;
                                });
                              },
                              child: galleryIcon(
                                  context, 'assets/icons/gallery_expand.svg'),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          showImagePicker(context, widget.updateImagesList, null, true);
                          // Navigator.pushNamed(context, '/soon');
                        },
                        child:
                            galleryIcon(context, 'assets/icons/add_image.svg'),
                      );
                    }
                  } else if (_showAllContainers) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/soon');
                      },
                      child: galleryIcon(context, 'assets/icons/add_image.svg'),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/gallery');
                      },
                      child: galleryIcon(context),
                    );
                  }
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/gallery');
                    },
                    child: galleryIcon(context),
                  );
                }
              }),
        ],
      ),
    );
  }
}

Widget galleryIcon(BuildContext context, [String? iconSrc = '']) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.25,
    height: MediaQuery.of(context).size.width * 0.25,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width / 2.0),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: iconSrc == ''
        ? const Text(
            'Container',
            style: TextStyle(color: Colors.white),
          )
        : SvgPicture.asset(
            iconSrc!,
            fit: BoxFit.fill,
          ),
  );
}
