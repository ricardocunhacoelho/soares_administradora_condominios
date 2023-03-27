import 'package:flutter_test/flutter_test.dart';

import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/profile.image.object.value.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';
import 'package:soares_administradora_condominios/worker/infra/adapters/json.to.from.worker.entity.adapter.dart';

void main() {
  test('deve converter um WorkEntity em map ', () async {
    final workerEntity = WorkerEntity(
        id: 'idWorker',
        userType: EUserType.worker,
        email: 'email',
        phoneNumber: '12333333333',
        qrid: 'qridtransformarmap',
        name: 'José',
        profileImage: '',
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
      'userType': 'worker',
      'email': 'email',
      'phoneNumber': '12333333333',
      'qrid': 'idqrcode',
      'name': 'José',
      'profileImage': {
        'getDownloadURL':
            'https://firebasestorage.googleapis.com/v0/b/soares-administradora-condomin.appspot.com/o/images%2FFBxri6tHsYhwf9QIqRl9q769jS53.jpg?alt=media&token=e7fcd587-221a-4efb-afa6-7e54321d8028',
        'refImage': 'images/FBxri6tHsYhwf9QIqRl9q769jS53.jpg'
      },
      'cpf': '15097396702',
      'bornDate': '2022-04-21 21:30:00',
      'function': 'sindico',
    });
    expect(workerEntity, isA<WorkerEntity>());
    expect(workerEntity.function, EFunctionWorkerEntity.sindico);
  });
}
