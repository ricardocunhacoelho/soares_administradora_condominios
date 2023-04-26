import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';

class JsonToFromPollingEntity {
  static Map<String, dynamic> toMap(PollingEntity polling) {
    return {
      'id': polling.id,
      'title': polling.title,
      'text': polling.text,
      'votesYes': polling.votesYes,
      'votesNo': polling.votesNo,
      'dateStart': polling.dateStart.toIso8601String(),
      'dateFinish': polling.dateFinish.toIso8601String(),
      'image': polling.image ?? polling.image,
    };
  }

  static PollingEntity fromMap(dynamic json) {
    return PollingEntity(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      image: json.containsKey('image') ? json['image'] : null,
      dateStart: DateTime.parse(json['dateStart']),
      dateFinish: DateTime.parse(json['dateFinish']),
      votesYes: json['votesYes'],
      votesNo: json['votesNo'],
    );
  }
}
