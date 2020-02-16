import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:steve_beaudoin/models/sub_topics.dart';

part 'topics.g.dart';

@JsonSerializable(nullable: false)
class TopicHeader {
  @required
  final int id;
  final String description;
  @required
  final String imageUrl;
  final List<SubTopics> subTopics;
  @required
  final String title;

  TopicHeader(
      {this.id, this.description, this.imageUrl, this.subTopics, this.title});

  factory TopicHeader.fromJson(Map<String, dynamic> json) {
    return _$TopicHeaderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopicHeaderToJson(this);
}
