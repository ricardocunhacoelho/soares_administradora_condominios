import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/adapters/json.to.from.house.service.provider.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

void main() {
  test('deve converter um HouseServiceProvider em map ', () {
    final houseServiceProviderEntity = HouseServiceProviderEntity(
      id: 'id',
      unit: UnitEntity(id: 'id', block: 'block', number: 2),
      name: 'name',
      phoneNumber: '12020202001',
      bornDate: DateTime.now(),
      cpf: 'cpf',
      picture: 'picture',
      recurringService: true,
      freePass: false,
      startWorkDate: DateTime.now(),
      workStartTimeDay: TimeOfDay.now(),
      endOfWorkTimeDay: TimeOfDay.now(),
      finishWorkDate: DateTime.now(),
    );
    final map =
        JsonToFromHouseServiceProviderEntity.toMap(houseServiceProviderEntity);
    print(map['finishWorkDate']); //deve retornar null
    expect(map, isA<Map>());
  });
  test('deve converter um map em um HouseServiceProvider', () {
    final houseServiceProviderEntity =
        JsonToFromHouseServiceProviderEntity.fromMap({
      'id': 'id',
      'unit': {'id': 'id', 'block': 'block', 'number': 2},
      'name': 'name',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': 'cpf',
      'phoneNumber': '1239191992012',
      'picture': 'picture',
      'recurringService': true,
      'freePass': false,
      'startWorkDate': '2022-04-21 21:30:00',
      'workStartTimeDay': '10:30',
      'endOfWorkTimeDay': '15:20',
      'finishWorkDate': '2022-04-21 21:30:00',
    });
    expect(houseServiceProviderEntity, isA<HouseServiceProviderEntity>());
    print(houseServiceProviderEntity.finishWorkDate); //deve retornar null
  });
}
