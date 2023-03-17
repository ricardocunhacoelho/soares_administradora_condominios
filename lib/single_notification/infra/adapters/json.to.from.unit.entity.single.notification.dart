
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

class JsonToFromSingleNotificationEntity {
  static Map<String, dynamic> toMap(
      SingleNotificationEntity singleNotificationEntity) {
    return {
      'id': singleNotificationEntity.id,
      'unit': JsonToFromUnitEntity.toMap(singleNotificationEntity.unit),
      'author': JsonToFromWorkerEntity.toMap(singleNotificationEntity.author),
      'receiver': singleNotificationEntity.receiver,
      'date': singleNotificationEntity.date.toIso8601String(),
      'title': singleNotificationEntity.title,
      'text': singleNotificationEntity.text,
      'image': singleNotificationEntity.image == null
          ? null
          : singleNotificationEntity.image!,
    };
  }

  static SingleNotificationEntity fromMap(dynamic json) {
    return SingleNotificationEntity(
      id: json['id'],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      author: JsonToFromWorkerEntity.fromMap(json['author']),
      receiver: json['receiver'],
      date: DateTime.parse(json['date']),
      title: json['title'],
      text: json['text'],
      image: json['image'] == null
          ? null
          : json['image']!,
    );
  }
}
