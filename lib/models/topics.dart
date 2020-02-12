import 'package:steve_beaudoin/models/sub_topics.dart';

class Topic {
  final int id;
  final String description;
  final String imageUrl;
  final List<SubTopics> subTopics;
  final String title;

  Topic(this.id, this.description, this.imageUrl, this.subTopics, this.title);
}
