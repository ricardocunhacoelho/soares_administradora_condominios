
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromVisitorEntity {
  static Map<String, dynamic> toMap(VisitorEntity visitorEntity) {
    return {
      'id': visitorEntity.id,
      'qrid': visitorEntity.qrid,
      'name': visitorEntity.name,
      'unit': JsonToFromUnitEntity.toMap(visitorEntity.unit),
      'cpf': visitorEntity.cpf,
      'bornDate': visitorEntity.bornDate.toIso8601String(),
      'picture': visitorEntity.picture,
      'freePass': visitorEntity.freePass,
      'startaccessDate': visitorEntity.startaccessDate.toIso8601String(),
      'startTimeAccessDay': visitorEntity.freePass
          ? null
          : visitorEntity.startTimeAccessDay!.toIso8601String(),
      'endTimeAccessDay': visitorEntity.freePass
          ? null
          : visitorEntity.endTimeAccessDay!.toIso8601String(),
      'finishaccessDate': visitorEntity.freePass
          ? null
          : visitorEntity.finishaccessDate!.toIso8601String(),
    };
  }

  static VisitorEntity fromMap(dynamic json) {
    return VisitorEntity(
      id: json['id'],
      qrid: json['qrid'],
      name: json['name'],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      cpf: json['cpf'],
      bornDate: DateTime.parse(json['bornDate']),
      picture: json['picture'],
      freePass: json['freePass'],
      startaccessDate: DateTime.parse(json['startaccessDate']),
      startTimeAccessDay: json['freePass']
          ? null
          : DateTime.parse(json['startTimeAccessDay']),
      endTimeAccessDay: json['freePass']
          ? null
          : DateTime.parse(json['endTimeAccessDay']),
      finishaccessDate: json['freePass']
          ? null
          : DateTime.parse(json['finishaccessDate']),
    );
  }
}
