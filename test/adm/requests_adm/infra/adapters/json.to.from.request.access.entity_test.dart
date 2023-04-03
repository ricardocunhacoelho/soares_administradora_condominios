import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.access.resident.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/domain/entity/request.entity.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/infra/adapters/json.to.from.request.access.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

void main() {
  test('deve converter um RequestAccessResidentEntity em map ', () async {
    final requestAccessEntity = RequestAccessResidentEntity(
        id: 'id',
        date: DateTime.now(),
        completed: false,
        requestType: ERequestType.access,
        resident: ResidentEntity(
            id: 'id',
            name: 'name',
            cpf: 'cpf',
            userType: EUserType.resident,
            email: 'email',
            bornDate: DateTime.now(),
            phoneNumber: 'phoneNumber',
            profileImage: '',
            profileImageThumb: '',
            picture: 'picture',
            notifications: [],
            access: false,
            unit: UnitEntity(id: 'id', block: 'block', number: 3),
            homeUnitEntity: 'homeUnitEntity',
            deliveriesReceived: []));
    final map =
        JsonToFromRequestAccessResidentEntity.toMap(requestAccessEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um RequestAccessEntity', () {
    final requestAccessResidentEntity =
        JsonToFromRequestAccessResidentEntity.fromMap({
      'id': 'id',
      'date': '2022-04-21 21:30:00',
      'completed': false,
      'requestType': 'access',
      'resident': {
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
      },
    });
    expect(requestAccessResidentEntity, isA<RequestAccessResidentEntity>());
  });
}
