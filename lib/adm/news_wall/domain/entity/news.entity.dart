class NewsEntity {
  final String id;
  final String title;
  final String text;
  final String author;
  final DateTime date;
  final String? image;

  NewsEntity({
    required this.id,
    required this.title,
    required this.text,
    required this.author,
    required this.date,
    this.image,
  });
}

enum ELevelUrgency { low, medium, high }
