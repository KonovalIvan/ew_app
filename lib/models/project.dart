import 'package:json_annotation/json_annotation.dart';

import 'package:ew_app/models/user.dart';
import 'package:ew_app/models/address.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  final String id;

  @JsonKey(name: 'address')
  final Address projectAddress;

  @JsonKey(name: 'client')
  final User clientUser;

  @JsonKey(name: 'owner')
  final User ownerUser;

  @JsonKey(name: 'building_master')
  final User buildingMasterUser;

  @JsonKey(name: 'designer')
  final User designerUser;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  final String name;
  final String description;
  final bool finished;

  Project({
    required this.id,
    required this.projectAddress,
    required this.clientUser,
    required this.ownerUser,
    required this.buildingMasterUser,
    required this.designerUser,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.finished,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
