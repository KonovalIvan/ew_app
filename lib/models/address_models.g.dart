// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['id'] as String?,
      json['address_line_2'] as String,
      addressLine_1: json['address_line_1'] as String,
      postCode: json['post_code'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'address_line_1': instance.addressLine_1,
      'address_line_2': instance.addressLine_2,
      'post_code': instance.postCode,
      'city': instance.city,
      'country': instance.country,
    };
