
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';

class JsonToFromNewsEntity {
  static Map<String, dynamic> toMap(NewsEntity news) {
    return {
      'id': news.id,
      'title': news.title,
      'text': news.text,
      'author': news.author,
      'date': news.date.toIso8601String(),
      'levelUrgency': news.levelUrgency.name,
      'image': news.image,
    };
  }

  static NewsEntity fromMap(dynamic json) {
    return NewsEntity(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      author: json['author'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      levelUrgency: ELevelUrgency.values.firstWhere(
        (element) => element.name == json['levelUrgency'],
      ),
    );
  }
}
