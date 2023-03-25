// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String,
      projectAddress: Address.fromJson(json['address'] as Map<String, dynamic>),
      clientUser: User.fromJson(json['client'] as Map<String, dynamic>),
      ownerUser: User.fromJson(json['owner'] as Map<String, dynamic>),
      buildingMasterUser:
          User.fromJson(json['building_master'] as Map<String, dynamic>),
      designerUser: User.fromJson(json['designer'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      finished: json['finished'] as bool,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.projectAddress,
      'client': instance.clientUser,
      'owner': instance.ownerUser,
      'building_master': instance.buildingMasterUser,
      'designer': instance.designerUser,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'description': instance.description,
      'finished': instance.finished,
    };
