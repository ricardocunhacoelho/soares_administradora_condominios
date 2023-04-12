
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromVisitorEntity {
  static Map<String, dynamic> toMap(VisitorEntity visitorEntity) {
    return {
      'id': visitorEntity.id,
      'name': visitorEntity.name,
      'cpf': visitorEntity.cpf,
      'bornDate': visitorEntity.bornDate.toIso8601String(),
      'phoneNumber': visitorEntity.phoneNumber,
      'picture': visitorEntity.picture,
      'unit': JsonToFromUnitEntity.toMap(visitorEntity.unit),
      'freePass': visitorEntity.freePass,
      'startaccessDate': visitorEntity.startaccessDate.toIso8601String(),
      'startTimeAccessDay': visitorEntity.freePass
          ? null
          : '${visitorEntity.startTimeAccessDay!.hour.toString().padLeft(2, '0')}:${visitorEntity.startTimeAccessDay!.minute.toString().padLeft(2, '0')}',
      'endTimeAccessDay': visitorEntity.freePass
          ? null
          : '${visitorEntity.endTimeAccessDay!.hour.toString().padLeft(2, '0')}:${visitorEntity.endTimeAccessDay!.minute.toString().padLeft(2, '0')}',
      'finishaccessDate': visitorEntity.freePass
          ? null
          : visitorEntity.finishaccessDate!.toIso8601String(),
    };
  }

  static VisitorEntity fromMap(dynamic json) {
    return VisitorEntity(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      bornDate: DateTime.parse(json['bornDate']),
      phoneNumber: json['phoneNumber'],
      picture: json['picture'],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      freePass: json['freePass'],
      startaccessDate: DateTime.parse(json['startaccessDate']),
      startTimeAccessDay: json['freePass']
          ? null
          : TimeOfDay(
              hour: int.parse(json['startTimeAccessDay'].split(":")[0]),
              minute: int.parse(json['startTimeAccessDay'].split(":")[1])),
      endTimeAccessDay: json['freePass']
          ? null
          : TimeOfDay(
              hour: int.parse(json['endTimeAccessDay'].split(":")[0]),
              minute: int.parse(json['endTimeAccessDay'].split(":")[1])),
      finishaccessDate:
          json['freePass'] ? null : DateTime.parse(json['finishaccessDate']),
    );
  }
}
