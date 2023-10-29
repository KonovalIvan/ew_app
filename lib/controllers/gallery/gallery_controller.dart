import 'dart:convert';

import 'package:ew_app/models/gallery_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/url.dart';

class GalleryController {
  late ImagesList imagesList;
  late int imageIndex = 0;
  late int galleryElementsCount = 0;

  late String accessToken;

  GalleryController() {
    _init();
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accessToken') ?? '';
  }

  void previousImage() {
    imageIndex += 1;
    if (imageIndex > galleryElementsCount - 1) {
      imageIndex = 0;
    }
  }

  void nextImage() {
    imageIndex -= 1;
    if (imageIndex < 0) {
      imageIndex = galleryElementsCount - 1;
    }
  }

  void openMainGallery(BuildContext context, GalleryController galleryController, VoidCallback voidCallback) {
    Navigator.pushNamed(context, '/gallery', arguments: GalleryArguments(galleryController)).then((result) {
      if (result == true) {
        voidCallback();
      }
    });
  }

  Future _sendImageDeleteRequest(String accessToken, String imageId) async {
    final url = Uri.parse(apiImageDeleteUrl.replaceFirst('{id}', imageId));
    final response =
    await http.delete(url, headers: {'Authorization': 'Token $accessToken'});
    if (response.statusCode != 204) {
      // TODO: in response i get error_msg, need in some way print information
      throw Exception(response.statusCode);
    }
  }

  Future<void> deleteImage(BuildContext context, String imageId) async {
    // TODO: Better decision will be add deleted images to new list and send one request
    // when user get back to project. But now i cant do it with my skill
    try {
      await _sendImageDeleteRequest(accessToken, imageId);

      imagesList.images.removeAt(imageIndex);
      galleryElementsCount = imagesList.images.length;
      if (imagesList.images.isEmpty) {
        Navigator.of(context).pop(true);
      }
      imageIndex = imageIndex > 0 ? imageIndex - 1 : imageIndex;

    } catch (error) {
      // TODO: catch errors!
      print(error);
    }
  }
}

class GalleryArguments {
  final GalleryController controller;

  GalleryArguments(this.controller);
}