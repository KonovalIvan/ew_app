// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleImageShortInfo _$SingleImageShortInfoFromJson(
        Map<String, dynamic> json) =>
    SingleImageShortInfo(
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SingleImageShortInfoToJson(
        SingleImageShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

SingleImage _$SingleImageFromJson(Map<String, dynamic> json) => SingleImage(
      name: json['image_name'] as String,
      size: json['image_size'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SingleImageToJson(SingleImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'image_name': instance.name,
      'image_size': instance.size,
    };

ImageShortInfoList _$ImageShortInfoListFromJson(Map<String, dynamic> json) =>
    ImageShortInfoList(
      images: (json['images'] as List<dynamic>)
          .map((e) => SingleImageShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageShortInfoListToJson(ImageShortInfoList instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

ImagesList _$ImagesListFromJson(Map<String, dynamic> json) => ImagesList(
      images: (json['images'] as List<dynamic>)
          .map((e) => SingleImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImagesListToJson(ImagesList instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
