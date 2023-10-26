import 'package:json_annotation/json_annotation.dart';

part 'gallery_models.g.dart';


@JsonSerializable()
class Image {
  final String id;
  final String image;

  Image({
    required this.id,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}


@JsonSerializable()
class ImagesList {
  final List<Image> images;

  ImagesList({required this.images});

  factory ImagesList.fromJson(List<dynamic> json) {
    List<Image> imagesList = [];
    for (var item in json ?? []) {
      imagesList.add(Image.fromJson(item));
    }
    return ImagesList(images: imagesList);
  }
}
