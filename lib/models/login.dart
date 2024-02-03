import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: 'token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  Login({
    required this.accessToken,
    this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}