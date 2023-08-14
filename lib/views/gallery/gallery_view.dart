import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/add_file_button_widget.dart';
import 'package:ew_app/widgets/buttons/options_button_widget.dart';
import 'package:ew_app/widgets/small_gallery_widget.dart';

import 'package:ew_app/controllers/dashboard_controller.dart';
import 'package:ew_app/widgets/buttons/main_button_widget.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  bool _visibleOptionsMenu = false;
  bool _visibleDeleteMenu = false;

  void updateEditable() {
    setState(() {
      _visibleOptionsMenu = !_visibleOptionsMenu;
    });
  }

  void updateVisibleDeleteMenu() {
    setState(() {
      _visibleDeleteMenu = !_visibleDeleteMenu;
    });
  }

  void pressNoDelete() {
    setState(() {
      _visibleDeleteMenu = false;
      _visibleOptionsMenu = false;
    });
  }

  void pressYesDelete() {
    setState(() {
      // TODO: logic for delete project
      Navigator.pop(context);
    });
  }

  // TODO: add transferred images list
  // TODO: add button to switching images
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(arrowColor: Colors.black),
        rightIconMenu: OptionsButtonWidget(optionsColor: Colors.black),
        onRightIconPressed: () {
          setState(() {
            _visibleOptionsMenu = !_visibleOptionsMenu;
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
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 5,
              child: Image.asset(
                'assets/images/test_gallery_img.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.contain,
              ),
            ),
            _visibleOptionsMenu
                ? Positioned.fill(
              child: Container(
                color: const Color(0x70000000),
              ),
            )
                : Container(),
            _visibleOptionsMenu
                ? OptionsWidget(
              heightElement: 50,
              onPressedDelete: updateVisibleDeleteMenu,
            )
                : Container(),
            _visibleDeleteMenu
                ? DeleteConfirmButtonWidget(
              onPressedNo: pressNoDelete,
              onPressedYes: pressYesDelete,
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
