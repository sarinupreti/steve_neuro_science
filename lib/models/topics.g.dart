// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicHeader _$TopicHeaderFromJson(Map json) {
  return TopicHeader(
    id: json['id'] as int,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    subTopics: (json['subTopics'] as List)
        .map((e) => SubTopics.fromJson(e as Map))
        .toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$TopicHeaderToJson(TopicHeader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'subTopics': instance.subTopics,
      'title': instance.title,
    };
