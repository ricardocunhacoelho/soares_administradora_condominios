import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/adapters/json.to.from.house.service.provider.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

void main() {
  test('deve converter um HouseServiceProvider em map ', () {
    final houseServiceProviderEntity = HouseServiceProviderEntity(
      id: 'id',
      qrid: 'qrid',
      unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
      name: 'name',
      bornDate: DateTime.now(),
      cpf: 'cpf',
      picture: 'picture',
      typeService: EtypeService.cleaning,
      recurringService: true,
      startWorkDate: DateTime.now(),
      workStartTimeDay: DateTime.now(),
      endOfWorkTimeDay: DateTime.now(),
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
      'qrid': 'qrid',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
      'name': 'name',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': 'cpf',
      'picture': 'picture',
      'typeService': 'cleaning',
      'recurringService': true,
      'startWorkDate': '2022-04-21 21:30:00',
      'workStartTimeDay': '2022-04-21 21:30:00',
      'endOfWorkTimeDay': '2022-04-21 21:30:00',
      'finishWorkDate': '2022-04-21 21:30:00',
    });
    expect(houseServiceProviderEntity, isA<HouseServiceProviderEntity>());
    print(houseServiceProviderEntity.finishWorkDate); //deve retornar null
  });
}
