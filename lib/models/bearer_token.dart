import 'package:json_annotation/json_annotation.dart';

part 'bearer_token.g.dart';

@JsonSerializable()
class BearerToken {
  final String access;
  final String refresh;

  BearerToken({
    required this.access,
    required this.refresh,
  });

  factory BearerToken.fromJson(Map<String, dynamic> json) =>
      _$BearerTokenFromJson(json);
  Map<String, dynamic> toJson() => _$BearerTokenToJson(this);
}