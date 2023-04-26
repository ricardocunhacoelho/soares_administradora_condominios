
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/irepositories/irepository.employee.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/adapters/json.to.from.employee.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/datasource/datasource.employee.dart';

class EmployeeRepository implements IEmployeeRepository {
  final IEmployeeDataSource employeeDataSource;
  EmployeeRepository(this.employeeDataSource);

  @override
  Stream<List<EmployeeEntity>> getAllEmployee() {
    final streamList = employeeDataSource.getAllEmployee();
    return streamList.map(_convert);
  }

  List<EmployeeEntity> _convert(List<dynamic> list) {
    var test1 = list.map(JsonToFromEmployeeEntity.fromMap).toList();
    return test1;
  }
}
