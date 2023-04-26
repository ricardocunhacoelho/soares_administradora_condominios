import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/adapters/json.to.from.polling.dart';

void main() {
    test('deve converter um Polling em map ', () {
    final pollingEntity = PollingEntity(
      id: 'idtransformarmap',
      votesYes: 5,
      votesNo: 5,
      title: 'vermelho',
      text: '8KB3',
      image: 'sedan',
      dateStart: DateTime.now(),
      dateFinish: DateTime.now(),
    );
    final map = JsonToFromPollingEntity.toMap(pollingEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um Polling', () {
    final pollingEntity = JsonToFromPollingEntity.fromMap({
      'id': 'idvehicle',
      'title': 'vermelho',
      'text': 'vermelho',
      'votesYes': 5,
      'votesNo': 5,
      'dateStart': '2022-04-21 21:30:00',
      'dateFinish': '2022-04-21 21:30:00',
    });
    expect(pollingEntity, isA<PollingEntity>());
  });
}