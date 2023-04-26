import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/worker/domain/entity/worker.entity.dart';
import 'package:soares_administradora_condominios/adm/employee/domain/entity/employee.entity.dart';

class JsonToFromWorkerEntity {
  static Map<String, dynamic> toMap(WorkerEntity workerEntity) {
    return {
      'id': workerEntity.id,
      'name': workerEntity.name,
      'cpf': workerEntity.cpf,
      'userType': workerEntity.userType.name,
      'email': workerEntity.email,
      'bornDate': workerEntity.bornDate.toIso8601String(),
      'phoneNumber': workerEntity.phoneNumber,
      'profileImage': workerEntity.profileImage,
      'profileImageThumb': workerEntity.profileImageThumb,
      'picture': workerEntity.picture,
      'notifications': workerEntity.notifications
          .map((e) => JsonToFromSingleNotificationEntity.toMap(e))
          .toList(),
      'access': workerEntity.access,
      'function': workerEntity.function.name,
    };
  }

  static WorkerEntity fromMap(dynamic json) {
    return WorkerEntity(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      userType: EUserType.values.firstWhere(
        (element) => element.name == json['userType'],
      ),
      email: json['email'],
      bornDate: DateTime.parse(json['bornDate']),
      phoneNumber: json['phoneNumber'],
      profileImage:
          json.containsKey('profileImage') ? json['profileImage'] : null,
      profileImageThumb: json.containsKey('profileImageThumb')
          ? json['profileImageThumb']
          : null,
      picture: json['picture'],
      notifications: json.containsKey('notifications')
          ? (json['notifications'] as List)
              .map(JsonToFromSingleNotificationEntity.fromMap)
              .toList()
          : [],
      access: json['access'],
      function: EFunctionEmployee.values.firstWhere(
        (element) => element.name == json['function'],
      ),
    );
  }
}
