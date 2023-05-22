import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.reservation.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/infra/adapters/json.to.from.response.polling.entity.dart';
import 'package:soares_administradora_condominios/delivery_received/infra/adapters/json.to.from.delivery.received.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class JsonToFromResidentEntity {
  static Map<String, dynamic> toMap(ResidentEntity residentEntity) {
    return {
      'id': residentEntity.id,
      'name': residentEntity.name,
      'cpf': residentEntity.cpf,
      'userType': residentEntity.userType.name,
      'email': residentEntity.email,
      'bornDate': residentEntity.bornDate.toIso8601String(),
      'phoneNumber': residentEntity.phoneNumber,
      'profileImage': residentEntity.profileImage,
      'profileImageThumb': residentEntity.profileImageThumb,
      'picture': residentEntity.picture,
      'notifications': residentEntity.notifications
          .map((e) => JsonToFromSingleNotificationEntity.toMap(e))
          .toList(),
      'access': residentEntity.access,
      'unit': JsonToFromUnitEntity.toMap(residentEntity.unit),
      'homeUnitEntity': residentEntity.homeUnitEntity,
      'deliveriesReceived': residentEntity.deliveriesReceived
          .map((e) => JsonToFromDeliveryReceivedEntity.toMap(e))
          .toList(),
      'answeredPolling': residentEntity.answeredPolling
          .map((e) => JsonToFromResponsePollingEntity.toMap(e))
          .toList(),
      'reserves': residentEntity.reserves
          .map((e) => JsonToFromReserveEntity.toMap(e))
          .toList(),
    };
  }

  static ResidentEntity fromMap(dynamic json) {
    return ResidentEntity(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      userType: EUserType.values.firstWhere(
        (element) => element.name == json['userType'],
      ),
      email: json['email'],
      bornDate: DateTime.parse(json['bornDate']),
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      profileImageThumb: json['profileImageThumb'],
      picture: json['picture'],
      notifications: json.containsKey('notifications')
          ? (json['notifications'] as List)
              .map(JsonToFromSingleNotificationEntity.fromMap)
              .toList()
          : [],
      access: json['access'],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      homeUnitEntity: json['homeUnitEntity'],
      deliveriesReceived: json.containsKey('deliveriesReceived')
          ? (json['deliveriesReceived'] as List)
              .map(JsonToFromDeliveryReceivedEntity.fromMap)
              .toList()
          : [],
      answeredPolling: json.containsKey('answeredPolling')
          ? (json['answeredPolling'] as List)
              .map(JsonToFromResponsePollingEntity.fromMap)
              .toList()
          : [],
      reserves: json.containsKey('reserves')
          ? (json['reserves'] as List)
              .map(JsonToFromReserveEntity.fromMap)
              .toList()
          : [],
    );
  }
}
