

import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/irepositories/irepository.employee.dart';

abstract class IGetAllEmployee {
  Stream<List<EmployeeEntity>> call();
}

class GetAllEmployee implements IGetAllEmployee {
  final IEmployeeRepository repository;

  GetAllEmployee(this.repository);
  @override
  Stream<List<EmployeeEntity>> call()  {
    return repository.getAllEmployee();
  }
}