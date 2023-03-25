// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressLine1: json['address_line_1'] as String,
      addressLine2: json['address_line_2'] as String,
      postCode: json['post_code'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'post_code': instance.postCode,
      'city': instance.city,
      'country': instance.country,
    };
