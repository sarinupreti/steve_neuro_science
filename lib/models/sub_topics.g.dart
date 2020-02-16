// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTopics _$SubTopicsFromJson(Map json) {
  return SubTopics(
    id: json['id'] as int,
    subTopicTItle: json['subTopicTItle'] as String,
    description: json['description'] as String,
    documents: (json['documents'] as List)
        ?.map((e) => e == null ? null : Documents.fromJson(e as Map))
        ?.toList(),
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SubTopicsToJson(SubTopics instance) => <String, dynamic>{
      'id': instance.id,
      'subTopicTItle': instance.subTopicTItle,
      'description': instance.description,
      'documents': instance.documents,
      'images': instance.images,
    };
