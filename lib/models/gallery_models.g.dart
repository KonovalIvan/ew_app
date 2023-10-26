// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

ImagesList _$ImagesListFromJson(Map<String, dynamic> json) => ImagesList(
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImagesListToJson(ImagesList instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
