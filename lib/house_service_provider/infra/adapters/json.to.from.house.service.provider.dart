
import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromHouseServiceProviderEntity {
  static Map<String, dynamic> toMap(
      HouseServiceProviderEntity houseServiceProviderEntity) {
    return {
      'id': houseServiceProviderEntity.id,
      'daysWeekAccess': houseServiceProviderEntity.daysWeekAccess,
      'name': houseServiceProviderEntity.name,
      'cpf': houseServiceProviderEntity.cpf,
      'bornDate': houseServiceProviderEntity.bornDate.toIso8601String(),
      'phoneNumber': houseServiceProviderEntity.phoneNumber,
      'picture': houseServiceProviderEntity.picture,
      'freePass': houseServiceProviderEntity.freePass,
      'unit': JsonToFromUnitEntity.toMap(houseServiceProviderEntity.unit),
      'recurringService': houseServiceProviderEntity.recurringService,
      'startWorkDate':
          houseServiceProviderEntity.startWorkDate.toIso8601String(),
      'workStartTimeDay': houseServiceProviderEntity.freePass
          ? null
          : '${houseServiceProviderEntity.workStartTimeDay!.hour.toString().padLeft(2, '0')}:${houseServiceProviderEntity.workStartTimeDay!.minute.toString().padLeft(2, '0')}',
      'endOfWorkTimeDay': houseServiceProviderEntity.freePass
          ? null
          : '${houseServiceProviderEntity.endOfWorkTimeDay!.hour.toString().padLeft(2, '0')}:${houseServiceProviderEntity.endOfWorkTimeDay!.minute.toString().padLeft(2, '0')}',
      'finishWorkDate': houseServiceProviderEntity.recurringService ||
              houseServiceProviderEntity.freePass
          ? null
          : houseServiceProviderEntity.finishWorkDate!.toIso8601String()
    };
  }

  static HouseServiceProviderEntity fromMap(dynamic json) {
    return HouseServiceProviderEntity(
        id: json['id'],
        daysWeekAccess: json['daysWeekAccess'],
        name: json['name'],
        cpf: json['cpf'],
        bornDate: DateTime.parse(json['bornDate']),
        phoneNumber: json['phoneNumber'],
        picture: json['picture'],
        unit: JsonToFromUnitEntity.fromMap(json['unit']),
        freePass: json['freePass'],
        recurringService: json['recurringService'],
        startWorkDate: DateTime.parse(json['startWorkDate']),
        workStartTimeDay: json['freePass']
            ? null
            : TimeOfDay(
                hour: int.parse(json['workStartTimeDay'].split(":")[0]),
                minute: int.parse(json['workStartTimeDay'].split(":")[1])),
        endOfWorkTimeDay: json['freePass']
            ? null
            : TimeOfDay(
                hour: int.parse(json['endOfWorkTimeDay'].split(":")[0]),
                minute: int.parse(json['endOfWorkTimeDay'].split(":")[1])),
        finishWorkDate: json['recurringService']
            ? null
            : DateTime.parse(json['finishWorkDate']));
            
  }
}
