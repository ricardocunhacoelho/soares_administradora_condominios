import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

void main() {
  test('deve converter um HomeUnitEntity em map ', () {
    final homeUnitEntity = HomeUnitEntity(
        id: 'id',
        email: 'email',
        userType: EUserType.homeUnit,
        phoneNumber: 'phoneNumber',
        title: 'title',
        residents: [
          ResidentEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'name',
              picture: 'picture',
              cpf: 'cpf',
              bornDate: DateTime.now(),
              unit: UnitEntity(
                  id: 'id', qrid: 'qrid', block: 'block', number: 2)),
          ResidentEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'name',
              picture: 'picture',
              cpf: 'cpf',
              bornDate: DateTime.now(),
              unit: UnitEntity(
                  id: 'id', qrid: 'qrid', block: 'block', number: 2)),
          ResidentEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'name',
              picture: 'picture',
              cpf: 'cpf',
              bornDate: DateTime.now(),
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2))
        ],
        vehicles: [
          VehicleEntity(
            id: 'idtransformarmap',
            color: 'vermelho',
            plate: '8KB3',
            model: 'sedan',
            year: 10,
          ),
          VehicleEntity(
            id: 'idtransformarmap',
            color: 'vermelho',
            plate: '8KB3',
            model: 'sedan',
            year: 10,
          ),
          VehicleEntity(
            id: 'idtransformarmap',
            color: 'vermelho',
            plate: '8KB3',
            model: 'sedan',
            year: 10,
          ),
        ],
        visitors: [
          VisitorEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'Gui',
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 3),
              cpf: '10598471612',
              bornDate: DateTime.now(),
              picture: 'picture',
              freePass: false,
              startaccessDate: DateTime.now(),
              startTimeAccessDay: DateTime.now(),
              endTimeAccessDay: DateTime.now(),
              finishaccessDate: DateTime(2022, 04, 21, 21, 30)),
          VisitorEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'Gui',
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 3),
              cpf: '10598471612',
              bornDate: DateTime.now(),
              picture: 'picture',
              freePass: false,
              startaccessDate: DateTime.now(),
              startTimeAccessDay: DateTime.now(),
              endTimeAccessDay: DateTime.now(),
              finishaccessDate: DateTime(2022, 04, 21, 21, 30)),
          VisitorEntity(
              id: 'id',
              qrid: 'qrid',
              name: 'Gui',
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 3),
              cpf: '10598471612',
              bornDate: DateTime.now(),
              picture: 'picture',
              freePass: false,
              startaccessDate: DateTime.now(),
              startTimeAccessDay: DateTime.now(),
              endTimeAccessDay: DateTime.now(),
              finishaccessDate: DateTime(2022, 04, 21, 21, 30)),
        ],
        houseServiceProviders: [
          HouseServiceProviderEntity(
            id: 'id',
            qrid: 'qrid',
            unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
            name: 'name',
            bornDate: DateTime.now(),
            cpf: 'cpf',
            picture: 'picture',
            typeService: EtypeService.cleaning,
            recurringService: true,
            startWorkDate: DateTime.now(),
            workStartTimeDay: DateTime.now(),
            endOfWorkTimeDay: DateTime.now(),
            finishWorkDate: DateTime.now(),
          ),
          HouseServiceProviderEntity(
            id: 'id',
            qrid: 'qrid',
            unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
            name: 'name',
            bornDate: DateTime.now(),
            cpf: 'cpf',
            picture: 'picture',
            typeService: EtypeService.cleaning,
            recurringService: true,
            startWorkDate: DateTime.now(),
            workStartTimeDay: DateTime.now(),
            endOfWorkTimeDay: DateTime.now(),
            finishWorkDate: DateTime.now(),
          ),
        ],
        deliveriesReceived: [
          DeliveryReceivedEntity(
              id: 'id',
              qrid: 'qrid',
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
              receiptStatus: EReceiptStatus.waitingPickUp,
              residentNameDestiny: 'residentNameDestiny',
              whoTookItName: 'whoTookItName',
              packagePicture: 'packagePicture',
              arrivalCondominiumDate: DateTime.now(),
              withdrawnDateResident: DateTime.now()),
        ],
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
        profileImage: 'profileImage',
        singleNotifications: [
          SingleNotificationEntity(
              id: 'id',
              unit:
                  UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
              author: WorkerEntity(
                  id: 'idWorker',
                  userType: EUserType.worker,
                  email: 'email',
                  phoneNumber: '12333333333',
                  qrid: 'qrid',
                  name: 'name',
                  picture: 'picture',
                  cpf: 'cpf',
                  bornDate: DateTime.now(),
                  function: EFunctionWorkerEntity.porteiro),
              receiver: 'receiver',
              date: DateTime.now(),
              title: 'title',
              text: 'text'),
        ]);
    final map = JsonToFromHomeUnitEntity.toMap(homeUnitEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um HomeUnitEntity', () {
    final homeUnitEntity = JsonToFromHomeUnitEntity.fromMap({
      'id': 'id',
      'userType': 'homeUnit',
      'phoneNumber': 'phoneNumber',
      'email': 'email',
      'title': 'title',
      'residents': [
        {
          'id': 'id',
          'qrid': 'qrid',
          'name': 'name',
          'picture': 'picture',
          'cpf': 'cpf',
          'bornDate': '2022-04-21 21:30:00',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
        },
        {
          'id': 'id',
          'qrid': 'qrid',
          'name': 'name',
          'picture': 'picture',
          'cpf': 'cpf',
          'bornDate': '2022-04-21 21:30:00',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
        }
      ],
      'vehicles': [
        {
          'id': 'idvehicle',
          'color': 'vermelho',
          'plate': '8KB3',
          'model': 'sedan',
          'year': 10,
        },
        {
          'id': 'idvehicle',
          'color': 'vermelho',
          'plate': '8KB3',
          'model': 'sedan',
          'year': 10,
        }
      ],
      'VisitorEntity': [
        {
          'id': 'idWorker',
          'qrid': 'idqrcode',
          'name': 'name',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 3},
          'cpf': '19087629810',
          'bornDate': '1996-12-25T21:30:00.000',
          'picture': 'idqrcode',
          'freePass': true,
          'startaccessDate': '2022-04-21T21:30:00.000',
        },
        {
          'id': 'idWorker',
          'qrid': 'idqrcode',
          'name': 'name',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 3},
          'cpf': '19087629810',
          'bornDate': '1996-12-25T21:30:00.000',
          'picture': 'idqrcode',
          'freePass': false,
          'startaccessDate': '2022-04-21T21:30:00.000',
          'startTimeAccessDay': '2022-04-21T21:30:00.000',
          'endTimeAccessDay': '2022-04-21T21:30:00.000',
          'finishaccessDate': '2022-04-21T21:30:00.000',
        }
      ],
      'HouseServiceProviderEntity': [
        {
          'id': 'id',
          'qrid': 'qrid',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
          'name': 'name',
          'bornDate': '2022-04-21 21:30:00',
          'cpf': 'cpf',
          'picture': 'picture',
          'typeService': 'cleaning',
          'recurringService': true,
          'startWorkDate': '2022-04-21 21:30:00',
          'workStartTimeDay': '2022-04-21 21:30:00',
          'endOfWorkTimeDay': '2022-04-21 21:30:00',
          'finishWorkDate': '2022-04-21 21:30:00',
        },
        {
          'id': 'id',
          'qrid': 'qrid',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
          'name': 'name',
          'bornDate': '2022-04-21 21:30:00',
          'cpf': 'cpf',
          'picture': 'picture',
          'typeService': 'cleaning',
          'recurringService': true,
          'startWorkDate': '2022-04-21 21:30:00',
          'workStartTimeDay': '2022-04-21 21:30:00',
          'endOfWorkTimeDay': '2022-04-21 21:30:00',
          'finishWorkDate': '2022-04-21 21:30:00',
        }
      ],
      'DeliveryReceivedEntity': [
        {
          'id': 'id',
          'qrid': 'qrid',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
          'receiptStatus': 'waitingPickUp',
          'residentNameDestiny': 'residentNameDestiny',
          'whoTookItName': 'whoTookItName',
          'packagePicture': 'packagePicture',
          'arrivalCondominiumDate': '2022-04-21 21:30:00',
          'withdrawnDateResident': '2022-04-21 21:30:00'
        }
      ],
      'singleNotifications': [
        {
          'id': 'id',
          'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
          'author': {
            'id': 'idWorker',
            'userType': 'worker',
            'email': 'email',
            'phoneNumber': '12333333333',
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
        }
      ],
      'profileImage': 'profileImage',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
    });
    expect(homeUnitEntity, isA<HomeUnitEntity>());
  });
}
