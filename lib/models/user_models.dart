import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserPart {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  UserPart(
    this.firstName,
    this.lastName,
  );

  factory UserPart.fromJson(Map<String, dynamic> json) =>
      _$UserPartFromJson(json);

  Map<String, dynamic> toJson() => _$UserPartToJson(this);
}

@JsonSerializable()
class User extends UserPart {
  final String username;
  final String email;

  User(
    String? firstName,
    String? lastName, {
    required this.username,
    required this.email,
  }) : super(firstName ?? '', lastName ?? '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
