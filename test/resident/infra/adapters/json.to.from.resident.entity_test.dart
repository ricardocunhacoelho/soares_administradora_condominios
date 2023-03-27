import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

void main() {
  test('deve converter um ResidentEntity em map ', () {
    final residentEntity = ResidentEntity(
        id: 'id',
        email: 'email',
        phoneNumber: 'qrid',
        name: 'name',
        picture: 'picture',
        cpf: 'cpf',
        bornDate: DateTime.now(),
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2));
    final map = JsonToFromResidentEntity.toMap(residentEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um ResidentEntity', () {
    final residentEntity = JsonToFromResidentEntity.fromMap({
      'id': 'id',
      'email': 'email',
      'phoneNumber': '28988035072',
      'name': 'name',
      'picture': 'picture',
      'cpf': 'cpf',
      'bornDate': '2022-04-21 21:30:00',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
    });
    expect(residentEntity, isA<ResidentEntity>());
  });
}
