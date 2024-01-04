import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/widgets/buttons_controller.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/controllers/projects/project_controller.dart';

class AddFileButtonWidget extends StatefulWidget {
  final ProjectController projectController;
  final Function update;

  const AddFileButtonWidget({
    super.key,
    required this.projectController,
    required this.update,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddFileButtonWidgetState createState() => _AddFileButtonWidgetState();
}

class _AddFileButtonWidgetState extends State<AddFileButtonWidget> {
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
          showImagePicker(
              context, widget.update, null, widget.projectController, null);

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

void showImagePicker(
  BuildContext context,
  Function update,
  AddFileButtonController? addFileButtonController,
  ProjectController? projectController,
  bool? updateImageList,
) {
  final AddFileButtonController _addFileButtonController =
      addFileButtonController ?? AddFileButtonController();

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
                var file =
                    await _addFileButtonController.getImageFromGallery(
                        projectController, updateImageList ?? false);
                update(file);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                var file = await _addFileButtonController.getImageFromCamera(
                    projectController, updateImageList ?? false);
                update(file);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
