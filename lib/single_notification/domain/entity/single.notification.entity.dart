import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

class SingleNotificationEntity{
  final String id;
  final HomeUnitEntity? unit;
  final WorkerEntity author;
  final UserEntity? receiver;
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