import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topics.g.dart';

@JsonSerializable(nullable: false)
class TopicHeader {
  @required
  final int id;
  final String description;
  @required
  final String imageUrl;
  final List<dynamic> subTopics;
  @required
  final String title;

  TopicHeader(
      {this.id, this.description, this.imageUrl, this.subTopics, this.title});

  factory TopicHeader.fromJson(Map<dynamic, dynamic> json) {
    final data = TopicHeader(
        id: json["id"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        subTopics: (json['subTopics'] as List)
            ?.map((e) => e == null ? null : (e))
            ?.toList(),
        title: json["title"]);

    print(data);
    return data;
  }

  Map<String, dynamic> toJson() => _$TopicHeaderToJson(this);
}
