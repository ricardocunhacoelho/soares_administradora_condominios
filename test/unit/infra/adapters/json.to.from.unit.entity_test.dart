import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

void main() {
  test('deve converter um UnitEntity em map ', () {
    final unitEntity = UnitEntity(
      id: 'idtransformarmap',
      qrid: 'qridtransformarmap',
      block: 'qridtransformarmap',
      number: 10,
    );
    final map = JsonToFromUnitEntity.toMap(unitEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um UnitEntity', () {
    final unitEntity = JsonToFromUnitEntity.fromMap({
      'id': 'idWorker',
      'qrid': 'idqrcode',
      'block': 'block',
      'number': 10,
    });
    expect(unitEntity, isA<UnitEntity>());
  });
}
