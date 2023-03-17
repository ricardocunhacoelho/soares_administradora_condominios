import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/visitor/infra/adapters/json.to.from.visitor.dart';

void main() {
  test('deve converter um VisitorEntity em map ', () {
    final visitorEntity = VisitorEntity(
        id: 'id',
        qrid: 'qrid',
        name: 'Gui',
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 3),
        cpf: '10598471612',
        bornDate: DateTime.now(),
        picture: 'picture',
        freePass: false,
        startaccessDate: DateTime.now(),
        startTimeAccessDay: DateTime.now(),
        endTimeAccessDay: DateTime.now(),
        finishaccessDate: DateTime(2022, 04, 21, 21, 30));

    //com freepass
    final visitorEntityWithFreePass = VisitorEntity(
        id: 'id',
        qrid: 'qrid',
        name: 'Gui',
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 3),
        cpf: '10598471612',
        bornDate: DateTime.now(),
        picture: 'picture',
        freePass: true,
        startaccessDate: DateTime.now(),
        startTimeAccessDay: DateTime.now(),
        endTimeAccessDay: DateTime.now());
    final map = JsonToFromVisitorEntity.toMap(visitorEntity);
    final mapWithFreePass =
        JsonToFromVisitorEntity.toMap(visitorEntityWithFreePass);
    print(
        'with freeAccess finishaccessDate is: ${mapWithFreePass['finishaccessDate']}');
    print(
        'with freeAccess startTimeAccessDay is: ${mapWithFreePass['startTimeAccessDay']}');
    print('with false in freeAccess: ${map['finishaccessDate']}');
    // print(
    //     '${visitorEntityWithFreePass.startaccessDate.hour}:${visitorEntityWithFreePass.startaccessDate.minute}');
    expect(map, isA<Map>());
  });
  test('deve converter um map em um VisitorEntity', () {
    final visitorEntity = JsonToFromVisitorEntity.fromMap({
      'id': 'idWorker',
      'qrid': 'idqrcode',
      'name': 'name',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 3},
      'cpf': '19087629810',
      'bornDate': '1996-12-25T21:30:00.000',
      'picture': 'idqrcode',
      'freePass': true,
      'startaccessDate': '2022-04-21T21:30:00.000',
    });
    final visitorEntityWithFreePass = JsonToFromVisitorEntity.fromMap({
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
    });
    print(
        'with freeAccess finishaccessDate is: ${visitorEntityWithFreePass.finishaccessDate}');
    print(
        'with freeAccess startTimeAccessDay is: ${visitorEntityWithFreePass.startTimeAccessDay}');
    print(
        'with false in freeAccess finishaccessDate is: ${visitorEntity.finishaccessDate}');
    expect(visitorEntity, isA<VisitorEntity>());
  });
}
