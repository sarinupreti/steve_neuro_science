// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documents _$DocumentsFromJson(Map json) {
  return Documents(
    documentId: json['documentId'] as int,
    documentLink: json['documentLink'] as String,
    documentName: json['documentName'] as String,
  );
}

Map<String, dynamic> _$DocumentsToJson(Documents instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'documentLink': instance.documentLink,
      'documentName': instance.documentName,
    };
