import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromHouseServiceProviderEntity {
  static Map<String, dynamic> toMap(
      HouseServiceProviderEntity houseServiceProviderEntity) {
    return {
      'id': houseServiceProviderEntity.id,
      'qrid': houseServiceProviderEntity.qrid,
      'unit': JsonToFromUnitEntity.toMap(houseServiceProviderEntity.unit),
      'name': houseServiceProviderEntity.name,
      'bornDate': houseServiceProviderEntity.bornDate.toIso8601String(),
      'cpf': houseServiceProviderEntity.cpf,
      'picture': houseServiceProviderEntity.picture,
      'typeService': houseServiceProviderEntity.typeService.name,
      'recurringService': houseServiceProviderEntity.recurringService,
      'startWorkDate':
          houseServiceProviderEntity.startWorkDate.toIso8601String(),
      'workStartTimeDay':
          houseServiceProviderEntity.workStartTimeDay.toIso8601String(),
      'endOfWorkTimeDay':
          houseServiceProviderEntity.endOfWorkTimeDay.toIso8601String(),
      'finishWorkDate': houseServiceProviderEntity.recurringService
          ? null
          : houseServiceProviderEntity.finishWorkDate!.toIso8601String()
    };
  }

  static HouseServiceProviderEntity fromMap(dynamic json) {
    return HouseServiceProviderEntity(
        id: json['id'],
        qrid: json['qrid'],
        unit: JsonToFromUnitEntity.fromMap(json['unit']),
        name: json['name'],
        bornDate: DateTime.parse(json['bornDate']),
        cpf: json['cpf'],
        picture: json['picture'],
        typeService: EtypeService.values.firstWhere(
          (element) => element.name == json['typeService'],
        ),
        recurringService: json['recurringService'],
        startWorkDate: DateTime.parse(json['startWorkDate']),
        workStartTimeDay: DateTime.parse(json['workStartTimeDay']),
        endOfWorkTimeDay: DateTime.parse(json['endOfWorkTimeDay']),
        finishWorkDate: json['recurringService']
            ? null
            : DateTime.parse(json['finishWorkDate']));
  }
}
