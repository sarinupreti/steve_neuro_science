import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable(nullable: false)
class LocationInfo {
  @required
  final int id;
  @required
  final double latitude;
  @required
  final double longitude;
  @required
  final String name;
  final String description;

  LocationInfo(
      {this.id, this.description, this.latitude, this.longitude, this.name});

  factory LocationInfo.fromJson(Map<dynamic, dynamic> json) {
    final data = LocationInfo(
        id: json["locationInfo"][0]["id"],
        description: json["locationInfo"][0]["description"],
        latitude: json["locationInfo"][0]["latitude"],
        longitude: json["locationInfo"][0]["longitude"],
        name: json["locationInfo"][0]["name"]);

    print(data);
    return data;
  }

  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);
}
