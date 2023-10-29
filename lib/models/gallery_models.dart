import 'package:json_annotation/json_annotation.dart';

part 'gallery_models.g.dart';


@JsonSerializable()
class SingleImage {
  final String id;
  final String image;

  SingleImage({
    required this.id,
    required this.image,
  });

  factory SingleImage.fromJson(Map<String, dynamic> json) =>
      _$SingleImageFromJson(json);

  Map<String, dynamic> toJson() => _$SingleImageToJson(this);
}


@JsonSerializable()
class ImagesList {
  final List<SingleImage> images;

  ImagesList({required this.images});

  factory ImagesList.fromJson(List<dynamic> json) {
    List<SingleImage> imagesList = [];
    for (var item in json ?? []) {
      imagesList.add(SingleImage.fromJson(item));
    }
    return ImagesList(images: imagesList);
  }
}
