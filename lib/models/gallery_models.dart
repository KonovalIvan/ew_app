import 'package:json_annotation/json_annotation.dart';

part 'gallery_models.g.dart';

@JsonSerializable()
class SingleImageShortInfo {
  final String id;
  final String image;


  SingleImageShortInfo({
    required this.id,
    required this.image,
  });

  factory SingleImageShortInfo.fromJson(Map<String, dynamic> json) =>
      _$SingleImageShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SingleImageShortInfoToJson(this);
}

@JsonSerializable()
class SingleImage {
  final String id;
  final String image;

  @JsonKey(name: 'image_name')
  final String name;

  @JsonKey(name: 'image_size')
  final String size;

  SingleImage({
    required this.name,
    required this.size,
    required this.id,
    required this.image,
  });

  factory SingleImage.fromJson(Map<String, dynamic> json) =>
      _$SingleImageFromJson(json);

  Map<String, dynamic> toJson() => _$SingleImageToJson(this);
}

@JsonSerializable()
class ImageShortInfoList {
  final List<SingleImageShortInfo> images;

  ImageShortInfoList({required this.images});

  factory ImageShortInfoList.fromJson(List<dynamic> json) {
    List<SingleImageShortInfo> imagesList = [];
    for (var item in json ?? []) {
      imagesList.add(SingleImageShortInfo.fromJson(item));
    }
    return ImageShortInfoList(images: imagesList);
  }
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
