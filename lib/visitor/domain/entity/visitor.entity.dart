import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class VisitorEntity {
  final String id;
  final String qrid;
  final String name;
  final UnitEntity unit;
  final String cpf;
  final DateTime bornDate;
  final String picture;
  final bool freePass;
  final DateTime startaccessDate;
  final DateTime? startTimeAccessDay;
  final DateTime? endTimeAccessDay;
  final DateTime? finishaccessDate;
  VisitorEntity({
    required this.id,
    required this.qrid,
    required this.name,
    required this.unit,
    required this.cpf,
    required this.bornDate,
    required this.picture,
    required this.freePass,
    required this.startaccessDate,
    required this.startTimeAccessDay,
    required this.endTimeAccessDay,
    this.finishaccessDate,
  });
}
