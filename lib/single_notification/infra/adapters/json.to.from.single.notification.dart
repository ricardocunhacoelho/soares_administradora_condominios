import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

class JsonToFromSingleNotificationEntity {
  static Map<String, dynamic> toMap(
      SingleNotificationEntity singleNotificationEntity) {
    return {
      'id': singleNotificationEntity.id,
      'homeUnitEntityId': singleNotificationEntity.homeUnitEntityId,
      'author': JsonToFromWorkerEntity.toMap(singleNotificationEntity.author),
      'receiverResident': JsonToFromResidentEntity.toMap(
          singleNotificationEntity.receiverResident!),
      'receiverWorker': JsonToFromWorkerEntity.toMap(
          singleNotificationEntity.receiverWorker!),
      'date': singleNotificationEntity.date.toIso8601String(),
      'title': singleNotificationEntity.title,
      'text': singleNotificationEntity.text,
      'image': singleNotificationEntity.image,
    };
  }

  static SingleNotificationEntity fromMap(dynamic json) {
    return SingleNotificationEntity(
      id: json['id'],
      homeUnitEntityId: json.containsKey('homeUnitEntityId')
          ? json['homeUnitEntityId']
          : null,
      author: JsonToFromWorkerEntity.fromMap(json['author']),
      receiverResident: json.containsKey('receiverResident')
          ? JsonToFromResidentEntity.fromMap(json['receiverResident'])
          : null,
      receiverWorker: json.containsKey('receiverWorker')
          ? JsonToFromWorkerEntity.fromMap(json['receiverWorker'])
          : null,
      date: DateTime.parse(json['date']),
      title: json['title'],
      text: json['text'],
      image: json.containsKey('image') ? json['image']! : null,
    );
  }
}
