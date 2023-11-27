import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:ew_app/constants/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ew_app/models/gallery_models.dart';

class SingleImageController {
  late SingleImage image;

  Future _sendImageDeleteRequest(String imageId) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    final url = Uri.parse(apiImageDeleteUrl.replaceFirst('{id}', imageId));
    final response = await http
        .delete(url, headers: {'Authorization': 'Token $accessToken'});
    if (response.statusCode != 204) {
      // TODO: in response i get error_msg, need in some way print information
      throw Exception(response.statusCode);
    }
  }

  Future<bool> deleteImage(BuildContext context, String imageId) async {
    try {
      await _sendImageDeleteRequest(imageId);
      Navigator.of(context).pop(true);
      return true;
    } catch (error) {
      // TODO: catch errors!
      print(error);
      rethrow;
    }
  }

  Future<void> openImage(BuildContext context,
      SingleImageController singleImageController, Function(String) voidCallback) async {
    Navigator.pushNamed(context, '/single_image',
            arguments: SingleImageArguments(singleImageController))
        .then((result) {
      if (result == true) {
        voidCallback(image.id);
      }
    });
  }
}

class SingleImageArguments {
  final SingleImageController controller;

  SingleImageArguments(this.controller);
}
