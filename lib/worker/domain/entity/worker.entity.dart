import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class WorkerEntity implements UserEntity {
  final String id;
  final EUserType userType;
  final String email;
  final String phoneNumber;
  final String qrid;
  final String name;
  final String picture;
  final String cpf;
  final DateTime bornDate;
  final EFunctionWorkerEntity function;
  WorkerEntity({
    required this.id,
    required this.userType,
    required this.email,
    required this.phoneNumber,
    required this.qrid,
    required this.name,
    required this.picture,
    required this.cpf,
    required this.bornDate,
    required this.function,
  });
}

enum EFunctionWorkerEntity { sindico, recepcionista, porteiro, zelador }
