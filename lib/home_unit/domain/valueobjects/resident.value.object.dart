import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/unit.value.object.dart';

class Resident {
  final String id;
  final String name;
  final int profileImage;
  final String cpf;
  final DateTime bornDate;
  final Unit unit;
  Resident({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.cpf,
    required this.bornDate,
    required this.unit,
  });
}
