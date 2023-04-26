

import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';

abstract class IEmployeeRepository {
  Stream<List<EmployeeEntity>> getAllEmployee();

}
