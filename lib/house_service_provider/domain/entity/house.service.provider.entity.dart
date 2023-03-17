import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class HouseServiceProviderEntity {
  final String id;
  final String qrid;
  final UnitEntity unit;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String picture;
  final EtypeService typeService;
  final bool recurringService;
  final DateTime startWorkDate;
  final DateTime workStartTimeDay;
  final DateTime endOfWorkTimeDay;
  final DateTime? finishWorkDate;
  HouseServiceProviderEntity({
    required this.id,
    required this.qrid,
    required this.unit,
    required this.name,
    required this.bornDate,
    required this.cpf,
    required this.picture,
    required this.typeService,
    required this.recurringService,
    required this.startWorkDate,
    required this.workStartTimeDay,
    required this.endOfWorkTimeDay,
    this.finishWorkDate,
  });
}

enum EtypeService { masonry, woodwork, network, cleaning, security }
