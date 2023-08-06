import 'dart:ffi';

import 'package:ew_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskGalleryWidget extends StatefulWidget {
  final int galleryCountElements;

  const TaskGalleryWidget({super.key, required this.galleryCountElements});

  @override
  // ignore: library_private_types_in_public_api
  _TaskGalleryWidgetState createState() => _TaskGalleryWidgetState();
}

class _TaskGalleryWidgetState extends State<TaskGalleryWidget> {
  bool _showAllContainers = false;

  int calculateLastElementPosition(int totalElemets) {
    if (totalElemets >= 4) {
      return 4;
    } else {
      return totalElemets;
    }
  }

  @override
  Widget build(BuildContext context) {
    int lastElement = calculateLastElementPosition(widget.galleryCountElements);

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
            itemCount:
                _showAllContainers ? widget.galleryCountElements : lastElement,
            itemBuilder: (context, index) {
              //TODO: Add button to add new image
              if (!_showAllContainers && lastElement == 4 && index == 3) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                      alignment: Alignment.center,
                      child: Text(
                        'Container ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showAllContainers = true;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/gallery_expand.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                  alignment: Alignment.center,
                  child: Text(
                    'Container ${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
