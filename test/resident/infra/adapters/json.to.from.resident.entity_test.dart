import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

void main() {
  test('deve converter um ResidentEntity em map ', () {
    final residentEntity = ResidentEntity(
        id: 'idWorker',
        name: 'Sindico Test',
        bornDate: DateTime.now(),
        cpf: '15097396702',
        phoneNumber: '28988035082',
        email: 'testesindico@gmail.com',
        profileImage: '',
        profileImageThumb: '',
        picture: 'retrato',
        userType: EUserType.visitor,
        notifications: [],
        access: true,
        unit: UnitEntity(id: 'id', block: 'block', number: 2),
        homeUnitEntity: '',
        deliveriesReceived: []);
    final map = JsonToFromResidentEntity.toMap(residentEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um ResidentEntity', () {
    final residentEntity = JsonToFromResidentEntity.fromMap({
      'id': 'id',
      'name': 'id',
      'cpf': 'id',
      'userType': 'resident',
      'email': 'id',
      'bornDate': '2022-04-21 21:30:00',
      'phoneNumber': 'id',
      'profileImage': 'id',
      'profileImageThumb': 'id',
      'picture': 'id',
      'notifications': [],
      'access': true,
      'unit': {'id': 'id', 'block': 'block', 'number': 2},
      'homeUnitEntity': 'id',
      'deliveriesReceived': [],
    });
    expect(residentEntity, isA<ResidentEntity>());
  });
}
