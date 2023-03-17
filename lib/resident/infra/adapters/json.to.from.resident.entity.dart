import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromResidentEntity {
  static Map<String, dynamic> toMap(ResidentEntity residentEntity) {
    return {
      'id': residentEntity.id,
      'qrid': residentEntity.qrid,
      'name': residentEntity.name,
      'picture': residentEntity.picture,
      'cpf': residentEntity.cpf,
      'bornDate': residentEntity.bornDate.toIso8601String(),
      'unit': JsonToFromUnitEntity.toMap(residentEntity.unit),
    };
  }

  static ResidentEntity fromMap(dynamic json) {
    return ResidentEntity(
      id: json['id'],
      qrid: json['qrid'],
      name: json['name'],
      picture: json['picture'],
      cpf: json['cpf'],
      bornDate: DateTime.parse(json['bornDate']),
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
    );
  }
}
