import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class JsonToFromHouseServiceProviderEntity {
  static Map<String, dynamic> toMap(
      HouseServiceProviderEntity houseServiceProviderEntity) {
    return {
      'id': houseServiceProviderEntity.id,
      'name': houseServiceProviderEntity.name,
      'cpf': houseServiceProviderEntity.cpf,
      'userType': houseServiceProviderEntity.userType.name,
      'email': houseServiceProviderEntity.email,
      'bornDate': houseServiceProviderEntity.bornDate.toIso8601String(),
      'phoneNumber': houseServiceProviderEntity.phoneNumber,
      'profileImage': houseServiceProviderEntity.profileImage,
      'profileImageThumb': houseServiceProviderEntity.profileImageThumb,
      'picture': houseServiceProviderEntity.picture,
      'notifications': houseServiceProviderEntity.notifications
          .map((e) => JsonToFromSingleNotificationEntity.toMap(e))
          .toList(),
      'access': houseServiceProviderEntity.access,
      'unit': JsonToFromUnitEntity.toMap(houseServiceProviderEntity.unit),
      'typeService': houseServiceProviderEntity.typeService.name,
      'recurringService': houseServiceProviderEntity.recurringService,
      'startWorkDate':
          houseServiceProviderEntity.startWorkDate.toIso8601String(),
      'workStartTimeDay':
          houseServiceProviderEntity.workStartTimeDay.toIso8601String(),
      'endOfWorkTimeDay':
          houseServiceProviderEntity.endOfWorkTimeDay.toIso8601String(),
      'finishWorkDate': houseServiceProviderEntity.recurringService
          ? null
          : houseServiceProviderEntity.finishWorkDate!.toIso8601String()
    };
  }

  static HouseServiceProviderEntity fromMap(dynamic json) {
    return HouseServiceProviderEntity(
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
        typeService: EtypeService.values.firstWhere(
          (element) => element.name == json['typeService'],
        ),
        recurringService: json['recurringService'],
        startWorkDate: DateTime.parse(json['startWorkDate']),
        workStartTimeDay: DateTime.parse(json['workStartTimeDay']),
        endOfWorkTimeDay: DateTime.parse(json['endOfWorkTimeDay']),
        finishWorkDate: json['recurringService']
            ? null
            : DateTime.parse(json['finishWorkDate']));
  }
}
