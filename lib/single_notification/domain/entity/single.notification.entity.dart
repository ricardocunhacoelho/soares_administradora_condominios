import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

class SingleNotificationEntity{
  final String id;
  final String? homeUnitEntityId;
  final WorkerEntity author;
  final ResidentEntity? receiverResident;
  final WorkerEntity? receiverWorker;
  final DateTime date;
  final String title;
  final String text;
  final String? image;
  SingleNotificationEntity({
    required this.id,
    required this.homeUnitEntityId,
    required this.author,
    required this.receiverResident,
    required this.receiverWorker,
    required this.date,
    required this.title,
    required this.text,
    this.image,
  });
}