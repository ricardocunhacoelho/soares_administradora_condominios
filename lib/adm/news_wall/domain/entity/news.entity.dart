class NewsEntity {
  final String id;
  final String title;
  final String text;
  final String author;
  final DateTime date;
  final ELevelUrgency levelUrgency;
  final String? image;

  NewsEntity({
    required this.id,
    required this.title,
    required this.text,
    required this.author,
    required this.date,
    required this.levelUrgency,
    this.image,
  });
}

enum ELevelUrgency { low, medium, high }
