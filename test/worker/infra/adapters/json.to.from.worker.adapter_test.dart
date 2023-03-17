import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

void main() {
  test('deve converter um WorkEntity em map ', () {
    final workerEntity = WorkerEntity(
        id: 'idtransformarmap',
        qrid: 'qridtransformarmap',
        name: 'José',
        picture: 'picture',
        cpf: 'cpf',
        bornDate: DateTime.now(),
        function: EFunctionWorkerEntity.sindico);
    final map = JsonToFromWorkerEntity.toMap(workerEntity);
    expect(map, isA<Map>());
    expect(map['function'], 'sindico');
  });
  test('deve converter um map em um WorkEntity', () {
    final workerEntity = JsonToFromWorkerEntity.fromMap({
      'id': 'idWorker',
      'qrid': 'idqrcode',
      'name': 'José',
      'picture': 'httppicture',
      'cpf': '15097396702',
      'bornDate': '2022-04-21 21:30:00',
      'function': 'sindico',
    });
    expect(workerEntity, isA<WorkerEntity>());
    expect(workerEntity.function, EFunctionWorkerEntity.sindico);
  });
}
