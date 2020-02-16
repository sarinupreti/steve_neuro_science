import 'package:json_annotation/json_annotation.dart';

part 'documents.g.dart';

@JsonSerializable()
class Documents {
  final int documentId;
  final String documentLink;
  final String documentName;

  Documents({this.documentId, this.documentLink, this.documentName});

  factory Documents.fromJson(Map<String, dynamic> json) =>
      _$DocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);
}
