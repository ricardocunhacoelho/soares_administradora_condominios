import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';

class JsonToFromEmployeeEntity {
  static Map<String, dynamic> toMap(EmployeeEntity employee) {
    return {
      'id': employee.id,
      'name': employee.name,
      'cpf': employee.cpf,
      'email': employee.email,
      'bornDate': employee.bornDate.toIso8601String(),
      'phoneNumber': employee.phoneNumber,
      'picture': employee.picture ?? employee.picture,
      'function': employee.function.name,
    };
  }

  static EmployeeEntity fromMap(dynamic json) {
    return EmployeeEntity(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      email: json['email'],
      bornDate: DateTime.parse(json['bornDate']),
      phoneNumber: json['phoneNumber'],
      picture: json.containsKey('picture') ? json['picture'] : null,
      function: EFunctionEmployee.values.firstWhere(
        (element) => element.name == json['function'],
      ),
    );
  }
}
