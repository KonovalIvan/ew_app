import 'package:json_annotation/json_annotation.dart';

part 'address_models.g.dart';

@JsonSerializable()
class Address {
  final String? id;

  @JsonKey(name: 'address_line_1')
  final String addressLine_1;

  @JsonKey(name: 'address_line_2')
  final String addressLine_2;

  @JsonKey(name: 'post_code')
  final String postCode;
  final String city;
  final String country;

  Address(
    this.id,
    this.addressLine_2, {
    required this.addressLine_1,
    required this.postCode,
    required this.city,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
