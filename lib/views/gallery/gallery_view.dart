import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/controllers/gallery/gallery_controller.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/options_button_widget.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({
    Key? key,
    required this.galleryController,
  }) : super(key: key);

  final GalleryController galleryController;

  @override
  // ignore: library_private_types_in_public_api
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  final OptionsButtonController _optionsButtonController =
      OptionsButtonController();

  // TODO: add button to switching images
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(
          arrowColor: Colors.black,
          update: true,
        ),
        rightIconMenu: OptionsButtonWidget(optionsColor: Colors.black),
        onRightIconPressed: () {
          setState(() {
            _optionsButtonController.visibleOptionsMenu =
                !_optionsButtonController.visibleOptionsMenu;
          });
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundDecorationGradient,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  // Right swipe
                  setState(() {
                    widget.galleryController.nextImage();
                  });
                } else if (details.primaryVelocity! < 0) {
                  // Left Swipe
                  setState(() {
                    widget.galleryController.previousImage();
                  });
                }
              },
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 5,
                child: Image.network(
                  '$baseUrl${widget.galleryController.imagesList.images[widget.galleryController.imageIndex].image}',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            _optionsButtonController.visibleOptionsMenu
                ? Positioned.fill(
                    child: Container(
                      color: const Color(0x70000000),
                    ),
                  )
                : Container(),
            _optionsButtonController.visibleOptionsMenu
                ? OptionsWidget(
                    heightElement: 50,
                    onPressedDelete: () {
                      setState(() {
                        _optionsButtonController.updateVisibleDeleteMenu();
                      });
                    },
                  )
                : Container(),
            _optionsButtonController.visibleDeleteMenu
                ? DeleteConfirmButtonWidget(
                    onPressedNo: () {
                      setState(
                        () {
                          _optionsButtonController.pressNoDelete();
                        },
                      );
                    },
                    onPressedYes: () async {
                      await widget.galleryController.deleteImage(
                          context,
                          widget.galleryController.imagesList
                              .images[widget.galleryController.imageIndex].id);
                      _optionsButtonController.visibleDeleteMenu = false;
                      _optionsButtonController.visibleOptionsMenu = false;
                      setState(
                        () {},
                      );
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
