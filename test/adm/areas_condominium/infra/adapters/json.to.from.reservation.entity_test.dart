import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reservation.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.reservation.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

void main() {
  test('deve converter um Reservation em map ', () {
    final reservationEntity = ReservationEntity(
      id: 'id',
      resident: ResidentEntity(
          id: 'id',
          name: 'name',
          cpf: 'cpf',
          userType: EUserType.resident,
          email: 'email',
          bornDate: DateTime.now(),
          phoneNumber: '55',
          profileImage: 'profileImage',
          profileImageThumb: 'profileImageThumb',
          picture: 'picture',
          notifications: [],
          access: true,
          unit: UnitEntity(id: 'id', block: 'block', number: 2),
          homeUnitEntity: 'homeUnitEntity',
          deliveriesReceived: [],
          answeredPolling: []),
      areaCondominium: AreaCondominiumEntity(
          id: 'id',
          title: 'title',
          rules: ['test'],
          description: 'description',
          numberOfPeople: 2,
          price: 2.0,
          reserveDateList: [],
          carouselImage: []),
      reservationDate: DateTime.now(),
      numberOfGuests: 40,
      paidOut: true,
    );
    final map = JsonToFromReservationEntity.toMap(reservationEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um Reservation', () {
    final reservationEntity = JsonToFromReservationEntity.fromMap({
      'id': 'idvehicle',
      'resident': {
        'id': 'id',
        'name': 'name',
        'cpf': 'cpf',
        'userType': 'resident',
        'email': 'email',
        'bornDate': '2022-04-21 21:30:00',
        'phoneNumber': '55',
        'profileImage': 'profileImage',
        'profileImageThumb': 'profileImageThumb',
        'picture': 'picture',
        'notifications': [],
        'access': true,
        'unit': {'id': 'id', 'block': 'block', 'number': 2},
        'homeUnitEntity': 'homeUnitEntity',
        'deliveriesReceived': [],
        'answeredPolling': []
      },
      'areaCondominium': {
        'id': 'id',
        'title': 'title',
        'rules': ['test'],
        'description': 'description',
        'numberOfPeople': 2,
        'price': 2.0,
        'reserveDateList': [],
        'carouselImage': ['asdasd']
      },
      'reservationDate': '2022-04-21 21:30:00',
      'numberOfGuests': 2,
      'paidOut': true,
    });
    expect(reservationEntity, isA<ReservationEntity>());
  });
}
