import 'package:flutter_test/flutter_test.dart';

import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/profile.image.object.value.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

void main() {
  test('deve converter um WorkEntity em map ', () async {
    final workerEntity = WorkerEntity(
      id: 'idWorker',
      name: 'Sindico Test',
      bornDate: DateTime.now(),
      cpf: '15097396702',
      phoneNumber: '28988035082',
      email: 'testesindico@gmail.com',
      profileImage: '',
      profileImageThumb: '',
      picture: 'retrato',
      userType: EUserType.workerCondominium,
      notifications: [],
      function: EFunctionWorkerEntity.sindico,
      access: true,
    );
    final map = JsonToFromWorkerEntity.toMap(workerEntity);
    expect(map, isA<Map>());
    expect(map['function'], 'sindico');
  });
  test('deve converter um map em um WorkEntity', () {
    final workerEntity = JsonToFromWorkerEntity.fromMap({
      'id': 'idWorker',
      'name': 'Sindico Test',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': '15097396702',
      'phoneNumber': '28988035082',
      'email': 'testesindico@gmail.com',
      'profileImage': '',
      'profileImageThumb': '',
      'picture': 'retrato',
      'userType': 'workerCondominium',
      'notifications': [],
      'function': 'sindico',
      'access': true,
    });
    expect(workerEntity, isA<WorkerEntity>());
    expect(workerEntity.function, EFunctionWorkerEntity.sindico);
  });
}
