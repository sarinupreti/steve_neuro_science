import 'package:json_annotation/json_annotation.dart';
import 'package:steve_beaudoin/models/documents.dart';

part 'sub_topics.g.dart';

@JsonSerializable()
class SubTopics {
  final int id;
  final String subTopicTItle;
  final String description;
  final List<Documents> documents;
  final List<String> images;

  SubTopics(
      {this.id,
      this.subTopicTItle,
      this.description,
      this.documents,
      this.images});

  factory SubTopics.fromJson(Map<String, dynamic> json) =>
      _$SubTopicsFromJson(json);

  Map<String, dynamic> toJson() => _$SubTopicsToJson(this);
}
