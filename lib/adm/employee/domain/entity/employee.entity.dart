
class EmployeeEntity {
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String email;
  final String? picture;
  final EFunctionEmployee function;
  EmployeeEntity({
    required this.id,
    required this.name,
    required this.bornDate,
    required this.cpf,
    required this.phoneNumber,
    required this.email,
    this.picture,
    required this.function,
  });
}

enum EFunctionEmployee { sindico, recepcionista, porteiro, zelador }
