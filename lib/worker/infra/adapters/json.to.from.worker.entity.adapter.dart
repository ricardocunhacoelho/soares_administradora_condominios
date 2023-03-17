import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';

class JsonToFromWorkerEntity {
  static Map<String, dynamic> toMap(WorkerEntity workerEntity) {
    return {
      'id': workerEntity.id,
      'qrid': workerEntity.qrid,
      'cpf': workerEntity.cpf,
      'bornDate': workerEntity.bornDate.toIso8601String(),
      'name': workerEntity.name,
      'picture': workerEntity.picture,
      'function': workerEntity.function.name,
    };
  }

  static WorkerEntity fromMap(dynamic json) {
    return WorkerEntity(
      id: json['id'],
      qrid: json['qrid'],
      name: json['name'],
      picture: json['picture'],
      cpf: json['cpf'],
      bornDate: DateTime.parse(json['bornDate']),
      function: EFunctionWorkerEntity.values.firstWhere(
        (element) => element.name == json['function'],
      ),
    );
  }
}
