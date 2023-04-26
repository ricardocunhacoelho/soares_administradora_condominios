import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/adapters/json.to.from.called.entity.dart';

void main() {
test('deve converter um Called em map ', () {
    final calledEntity = CalledEntity(
      id: 'id',
      about: 'about',
      message: 'vermelho',
      dateSend: DateTime.now(),
      dateSeen: DateTime.now(),
      seen: true,
    );
    final map = JsonToFromCalledEntity.toMap(calledEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um Called', () {
    final calledEntity = JsonToFromCalledEntity.fromMap({
      'id': 'idvehicle',
      'about': 'vermelho',
      'message': 'vermelho',
      'dateSend': '2022-04-21 21:30:00',
      'dateSeen': '2022-04-21 21:30:00',
      'seen': true,
    });
    expect(calledEntity, isA<CalledEntity>());
  });
}