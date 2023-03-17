import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.unit.entity.single.notification.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

void main() {
  test('deve converter um SingleNotificationEntity em map ', () {
    final singleNotificationEntity = SingleNotificationEntity(
        id: 'id',
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
        author: WorkerEntity(
            id: 'id',
            qrid: 'qrid',
            name: 'name',
            picture: 'picture',
            cpf: 'cpf',
            bornDate: DateTime.now(),
            function: EFunctionWorkerEntity.porteiro),
        receiver: 'receiver',
        date: DateTime.now(),
        title: 'title',
        text: 'text');
    final map =
        JsonToFromSingleNotificationEntity.toMap(singleNotificationEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um SingleNotificationEntity', () {
    final singleNotificationEntity =
        JsonToFromSingleNotificationEntity.fromMap({
      'id': 'id',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
      'author': {
        'id': 'id',
        'qrid': 'qrid',
        'name': 'name',
        'picture': 'picture',
        'cpf': '1231331312332',
        'bornDate': '2022-04-21 21:30:00',
        'function': 'porteiro'
      },
      'receiver': 'receiver',
      'date': '2022-04-21 21:30:00',
      'title': 'title',
      'text': 'text'
    });
    expect(singleNotificationEntity, isA<SingleNotificationEntity>());
  });
}
