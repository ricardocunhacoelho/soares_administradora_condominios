import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class VisitorEntity {
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String? picture;
  final bool access;
  final UnitEntity unit;
  final bool freePass;
  final DateTime startaccessDate;
  final DateTime? startTimeAccessDay;
  final DateTime? endTimeAccessDay;
  final DateTime? finishaccessDate;
  VisitorEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.bornDate,
    required this.phoneNumber,
    required this.picture,
    required this.access,
    required this.unit,
    required this.freePass,
    required this.startaccessDate,
    required this.startTimeAccessDay,
    required this.endTimeAccessDay,
    this.finishaccessDate,
  });
}
