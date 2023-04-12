import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class JsonToFromUnitEntity {
  static Map<String, dynamic> toMap(UnitEntity unitEntity) {
    return {
      'id': unitEntity.id,
      'block': unitEntity.block,
      'number': unitEntity.number,
    };
  }

  static UnitEntity fromMap(dynamic json) {
    return UnitEntity(
      id: json['id'],
      block: json['block'],
      number: json['number'],
    );
  }
}
