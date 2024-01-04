import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ew_app/constants/url.dart';
import 'package:ew_app/models/gallery_models.dart';

import '../controllers/gallery/single_image_view.dart';

class TaskGalleryWidget extends StatefulWidget {
  final ImageShortInfoList? galleryElements;
  final Function updateImagesList;
  final String projectId;
  final String taskId;

  const TaskGalleryWidget({
    super.key,
    required this.galleryElements,
    required this.updateImagesList,
    required this.projectId,
    required this.taskId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TaskGalleryWidgetState createState() => _TaskGalleryWidgetState();
}

// TODO: FIX: currently for all images send 1, 2, 3 and more requests. Add get images to one request
class _TaskGalleryWidgetState extends State<TaskGalleryWidget> {
  bool _showAllContainers = false;
  AddFileButtonController addFileButtonController = AddFileButtonController();

  void deleteImage(String imageId) {
    widget.galleryElements?.images.removeWhere((image) => image.id == imageId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int elementCount = widget.galleryElements?.images.length ?? 0;
    addFileButtonController.projectId = widget.projectId;
    addFileButtonController.taskId = widget.taskId;

    final itemCount = _showAllContainers
        ? elementCount + 1
        : elementCount >= 4
            ? 4
            : elementCount + 1;

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
                              child: galleryIcon(context, false,
                                  'assets/icons/gallery_expand.svg'),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          showImagePicker(
                              context, widget.updateImagesList, addFileButtonController, null, false);
                        },
                        child: galleryIcon(
                            context, false, 'assets/icons/add_image.svg'),
                      );
                    }
                  } else if (_showAllContainers) {
                    return GestureDetector(
                      onTap: () {
                        showImagePicker(
                            context, widget.updateImagesList, addFileButtonController, null, false);
                      },
                      child: galleryIcon(
                          context, false, 'assets/icons/add_image.svg'),
                    );
                  } else {
                    String? imageUrl =
                        widget.galleryElements?.images[index].image;
                    return GestureDetector(
                      onTap: () {
                        SingleImageController singleImageController = SingleImageController();
                        singleImageController.image = widget.galleryElements!.images[index];
                        singleImageController.openImage(
                            context, singleImageController, deleteImage);
                      },
                      child: galleryIcon(context, true, imageUrl),
                    );
                  }
                } else {
                  String? imageUrl =
                      widget.galleryElements?.images[index].image;
                  return GestureDetector(
                    onTap: () {
                      SingleImageController singleImageController = SingleImageController();
                      singleImageController.image = widget.galleryElements!.images[index];
                      singleImageController.openImage(
                          context, singleImageController, deleteImage);
                    },
                    child: galleryIcon(context, true, imageUrl),
                  );
                }
              }),
        ],
      ),
    );
  }
}

Widget galleryIcon(
  BuildContext context,
  bool networkImage,
  String? imagePath,
) {
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
    child: ClipOval(
      child: Visibility(
        visible: networkImage,
        replacement: SvgPicture.asset(
          imagePath!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        child: Image.network(
          '$baseUrl$imagePath',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

