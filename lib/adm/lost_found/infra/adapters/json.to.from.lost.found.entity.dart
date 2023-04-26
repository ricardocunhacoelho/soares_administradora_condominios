import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';

class JsonToFromLostFoundEntity {
  static Map<String, dynamic> toMap(LostFoundEntity lostFound) {
    return {
      'id': lostFound.id,
      'title': lostFound.title,
      'details': lostFound.details,
      'image': lostFound.image,
      'foundDate': lostFound.foundDate.toIso8601String(),
    };
  }

  static LostFoundEntity fromMap(dynamic json) {
    return LostFoundEntity(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      image: json['image'],
      foundDate: DateTime.parse(json['foundDate']),
    );
  }
}
