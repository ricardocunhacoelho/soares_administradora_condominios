import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromVisitorEntity {
  static Map<String, dynamic> toMap(VisitorEntity visitorEntity) {
    return {
      'id': visitorEntity.id,
      'name': visitorEntity.name,
      'cpf': visitorEntity.cpf,
      'userType': visitorEntity.userType.name,
      'email': visitorEntity.email,
      'bornDate': visitorEntity.bornDate.toIso8601String(),
      'phoneNumber': visitorEntity.phoneNumber,
      'profileImage': visitorEntity.profileImage,
      'profileImageThumb': visitorEntity.profileImageThumb,
      'picture': visitorEntity.picture,
      'notifications': visitorEntity.notifications
          .map((e) => JsonToFromSingleNotificationEntity.toMap(e))
          .toList(),
      'access': visitorEntity.access,
      'unit': JsonToFromUnitEntity.toMap(visitorEntity.unit),
      'freePass': visitorEntity.freePass,
      'startaccessDate': visitorEntity.startaccessDate.toIso8601String(),
      'startTimeAccessDay': visitorEntity.freePass
          ? null
          : visitorEntity.startTimeAccessDay!.toIso8601String(),
      'endTimeAccessDay': visitorEntity.freePass
          ? null
          : visitorEntity.endTimeAccessDay!.toIso8601String(),
      'finishaccessDate': visitorEntity.freePass
          ? null
          : visitorEntity.finishaccessDate!.toIso8601String(),
    };
  }

  static VisitorEntity fromMap(dynamic json) {
    return VisitorEntity(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      userType: EUserType.values.firstWhere(
        (element) => element.name == json['userType'],
      ),
      email: json['email'],
      bornDate: DateTime.parse(json['bornDate']),
      phoneNumber: json['phoneNumber'],
      profileImage: json.containsKey('profileImage') ? json['profileImage'] : null,
      profileImageThumb: json.containsKey('profileImageThumb') ? json['profileImageThumb'] : null,
      picture: json['picture'],
      notifications: json.containsKey('notifications')
          ? (json['notifications'] as List)
              .map(JsonToFromSingleNotificationEntity.fromMap)
              .toList()
          : [],
      access: json['access'],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      freePass: json['freePass'],
      startaccessDate: DateTime.parse(json['startaccessDate']),
      startTimeAccessDay:
          json['freePass'] ? null : DateTime.parse(json['startTimeAccessDay']),
      endTimeAccessDay:
          json['freePass'] ? null : DateTime.parse(json['endTimeAccessDay']),
      finishaccessDate:
          json['freePass'] ? null : DateTime.parse(json['finishaccessDate']),
    );
  }
}
