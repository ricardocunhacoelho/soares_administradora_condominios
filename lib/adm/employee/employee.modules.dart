import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/irepositories/irepository.employee.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/usecases/get.all.employee.dart';
import 'package:soares_administradora_condominios/adm/employee/external/firebase.employee.external.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/datasource/datasource.employee.dart';
import 'package:soares_administradora_condominios/adm/employee/infra/repositories/repository.employee.dart';




final employeeModules = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IEmployeeDataSource>(
      create: (context) =>
          EmployeeFirebase(context.read())),
  Provider<IEmployeeRepository>(
      create: (context) => EmployeeRepository(context.read())),
  //usecases
  Provider<IGetAllEmployee>(
      create: (context) => GetAllEmployee(context.read())),
];
