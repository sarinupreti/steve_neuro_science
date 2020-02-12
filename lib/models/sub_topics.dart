import 'package:steve_beaudoin/models/documents.dart';

class SubTopics {
  final int id;
  final String subTopicTItle;
  final String description;
  final List<Documents> documents;
  final List<String> images;

  SubTopics(this.id, this.subTopicTItle, this.description, this.documents,
      this.images);
}
