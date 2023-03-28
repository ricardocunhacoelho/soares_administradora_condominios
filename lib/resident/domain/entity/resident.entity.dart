import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class ResidentEntity {
  final String id;
  final String email;
  final String phoneNumber;
  final String name;
  final String picture;
  final String cpf;
  final DateTime bornDate;
  final UnitEntity unit;
  ResidentEntity({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.picture,
    required this.cpf,
    required this.bornDate,
    required this.unit,
  });
}
