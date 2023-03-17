
class WorkerEntity {
  final String id;
  final String qrid;
  final String name;
  final String picture;
  final String cpf;
  final DateTime bornDate;
  final EFunctionWorkerEntity function;
  WorkerEntity({
    required this.id,
    required this.qrid,
    required this.name,
    required this.picture,
    required this.cpf,
    required this.bornDate,
    required this.function,
  });
}

enum EFunctionWorkerEntity { sindico, recepcionista, porteiro, zelador }
