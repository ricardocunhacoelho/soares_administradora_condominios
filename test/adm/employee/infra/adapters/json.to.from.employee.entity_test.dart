
import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/adapters/json.to.from.employee.entity.dart';

void main() {
  
    test('deve converter um Employee em map ', () async {
    final employeeEntity = EmployeeEntity(
      id: 'idWorker',
      name: 'Sindico Test',
      bornDate: DateTime.now(),
      cpf: '15097396702',
      phoneNumber: '28988035082',
      email: 'testesindico@gmail.com',
      picture: 'retrato',
      function: EFunctionEmployee.sindico,
    );
    final map = JsonToFromEmployeeEntity.toMap(employeeEntity);
    expect(map, isA<Map>());
    expect(map['function'], 'sindico');
  });

  test('deve converter um map em um Employee', () {
    final employeeEntity = JsonToFromEmployeeEntity.fromMap({
      'id': 'idWorker',
      'name': 'Sindico Test',
      'bornDate': '2022-04-21 21:30:00',
      'cpf': '15097396702',
      'phoneNumber': '28988035082',
      'email': 'testesindico@gmail.com',
      'function': 'sindico',
    });
    expect(employeeEntity, isA<EmployeeEntity>());
    expect(employeeEntity.function, EFunctionEmployee.sindico);
  });
}