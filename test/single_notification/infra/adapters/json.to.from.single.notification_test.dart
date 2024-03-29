import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/domain/valueobjects/profile.image.object.value.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

void main() {
  test('deve converter um SingleNotificationEntity em map ', () async {
    final singleNotificationEntity = SingleNotificationEntity(
        id: 'id',
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
        author: WorkerEntity(
            id: 'idWorker',
            userType: EUserType.worker,
            email: 'email',
            phoneNumber: '12333333333',
            qrid: 'qrid',
            name: 'name',
            profileImage: '',
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
        'id': 'idWorker',
        'userType': 'worker',
        'email': 'email',
        'phoneNumber': '12333333333',
        'qrid': 'qrid',
        'name': 'name',
        'profileImage': {'getDownloadURL': 'getDownloadURL', 'ref': 'ref'},
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
