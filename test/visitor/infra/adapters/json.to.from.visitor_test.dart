import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/visitor/infra/adapters/json.to.from.visitor.dart';

void main() {
  test('deve converter um VisitorEntity em map ', () {
    final visitorEntity = VisitorEntity(
        id: 'idWorker',
        name: 'Sindico Test',
        bornDate: DateTime.now(),
        cpf: '15097396702',
        phoneNumber: '28988035082',
        picture: 'retrato',
        unit: UnitEntity(id: 'id', block: 'block', number: 3),
        freePass: false,
        startaccessDate: DateTime.now(),
        startTimeAccessDay: TimeOfDay.now(),
        endTimeAccessDay: TimeOfDay.now(),
        finishaccessDate: DateTime(2022, 04, 21, 21, 30));

    //com freepass
    final visitorEntityWithFreePass = VisitorEntity(
        id: 'idWorker',
        name: 'Sindico Test',
        bornDate: DateTime.now(),
        cpf: '15097396702',
        phoneNumber: '28988035082',
        picture: 'retrato',
        unit: UnitEntity(id: 'id', block: 'block', number: 3),
        freePass: true,
        startaccessDate: DateTime.now(),
        startTimeAccessDay: TimeOfDay.now(),
        endTimeAccessDay: TimeOfDay.now());
    final map = JsonToFromVisitorEntity.toMap(visitorEntity);
    final mapWithFreePass =
        JsonToFromVisitorEntity.toMap(visitorEntityWithFreePass);
    print(
        'with freeAccess finishaccessDate is: ${mapWithFreePass['finishaccessDate']}');
    print(
        'with freeAccess startTimeAccessDay is: ${mapWithFreePass['startTimeAccessDay']}');
    print('with false in freeAccess: ${map['finishaccessDate']}');
    print(
        mapWithFreePass['startTimeAccessDay']);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um VisitorEntity', () {
    final visitorEntity = JsonToFromVisitorEntity.fromMap({
      'id': 'idWorker',
      'name': 'Sindico Test',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': '15097396702',
      'phoneNumber': '28988035082',
      'picture': 'retrato',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 3},
      'freePass': false,
      'startaccessDate': '2022-04-21T21:30:00.000',
    });
    final visitorEntityWithFreePass = JsonToFromVisitorEntity.fromMap({
      'id': 'idWorker',
      'name': 'Sindico Test',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': '15097396702',
      'phoneNumber': '28988035082',
      'picture': 'retrato',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 3},
      'freePass': true,
      'startaccessDate': '2022-04-21T21:30:00.000',
      'startTimeAccessDay': '10:25',
      'endTimeAccessDay': '13:10',
      'finishaccessDate': '2022-04-21T21:30:00.000',
    });
    print(
        'with freeAccess finishaccessDate is: ${visitorEntityWithFreePass.finishaccessDate}');
    print(
        'with freeAccess startTimeAccessDay is: ${visitorEntityWithFreePass.startTimeAccessDay!.hour}');
    print(
        'with false in freeAccess finishaccessDate is: ${visitorEntity.finishaccessDate}');
    expect(visitorEntity, isA<VisitorEntity>());
  });
}
