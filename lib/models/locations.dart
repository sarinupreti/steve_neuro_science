import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable(nullable: false)
class LocationInfo {
  @required
  final int id;
  @required
  final double location;
  @required
  final String name;
  final String description;

  LocationInfo({this.id, this.description, this.location, this.name});

  factory LocationInfo.fromJson(Map<dynamic, dynamic> json) {
    final data = LocationInfo(
        id: json["id"],
        description: json["description"],
        location: json["location"],
        name: json["name"]);

    print(data);
    return data;
  }

  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);
}
