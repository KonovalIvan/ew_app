import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/projects/project_controller.dart';

class AddFileButtonWidget extends StatefulWidget {
  const AddFileButtonWidget({super.key, required this.projectController, required this.update});

  final ProjectController projectController;
  final Function update;

  @override
  // ignore: library_private_types_in_public_api
  _AddFileButtonWidgetState createState() => _AddFileButtonWidgetState();
}

class _AddFileButtonWidgetState extends State<AddFileButtonWidget> {
  final AddFileButtonController _addFileButtonController =
  AddFileButtonController();

  void _showImagePicker(BuildContext context) {
    // TODO: think how can i use showModalBottomSheet in options (edit delete) menu
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  await _addFileButtonController.getImageFromGallery(widget.projectController);
                  widget.update();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  await _addFileButtonController.getImageFromCamera(widget.projectController);
                  widget.update();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0x50C4C4C4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          _showImagePicker(context);
        },
        child: Text(
          'Tap to add Files',
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
