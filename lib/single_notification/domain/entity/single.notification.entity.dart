import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

class SingleNotificationEntity{
  final String id;
  final UnitEntity unit;
  final WorkerEntity author;
  final String receiver;
  final DateTime date;
  final String title;
  final String text;
  final String? image;
  SingleNotificationEntity({
    required this.id,
    required this.unit,
    required this.author,
    required this.receiver,
    required this.date,
    required this.title,
    required this.text,
    this.image,
  });
}