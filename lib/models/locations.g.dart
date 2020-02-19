// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationInfo _$LocationInfoFromJson(Map json) {
  return LocationInfo(
    id: json['id'] as int,
    description: json['description'] as String,
    location: (json['location'] as num).toDouble(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LocationInfoToJson(LocationInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'name': instance.name,
      'description': instance.description,
    };
