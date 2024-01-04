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
class UserAvatar {
  final String? avatar;

  UserAvatar(this.avatar);

  factory UserAvatar.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$UserAvatarToJson(this);
}

@JsonSerializable()
class User extends UserPart {
  final String email;

  final String? avatar;

  User(
    String? firstName,
    String? lastName, {
    required this.email,
    required this.avatar,
  }) : super(firstName ?? '', lastName ?? '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
