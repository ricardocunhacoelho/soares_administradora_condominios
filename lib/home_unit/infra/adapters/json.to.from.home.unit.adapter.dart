import 'package:soares_administradora_condominios/delivery_received/infra/adapters/json.to.from.delivery.received.dart';
import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/adapters/json.to.from.house.service.provider.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/infra/adapters/json.to.from.single.notification.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';
import 'package:soares_administradora_condominios/user/infra/adapters/json.to.from.profile.image.dart';
import 'package:soares_administradora_condominios/vehicle/infra/adapters/json.to.from.visitor.vehicle.dart';
import 'package:soares_administradora_condominios/visitor/infra/adapters/json.to.from.visitor.dart';

class JsonToFromHomeUnitEntity {
  static Map<String, dynamic> toMap(HomeUnitEntity homeUnit) {
    return {
      'id': homeUnit.id,
      'residents': homeUnit.residents
          .map((e) => JsonToFromResidentEntity.toMap(e))
          .toList(),
      'vehicles': homeUnit.vehicles
          .map((e) => JsonToFromVehicleEntity.toMap(e))
          .toList(),
      'visitors': homeUnit.visitors
          .map((e) => JsonToFromVisitorEntity.toMap(e))
          .toList(),
      'houseServiceProviders': homeUnit.houseServiceProviders
          .map((e) => JsonToFromHouseServiceProviderEntity.toMap(e))
          .toList(),
      'unit': JsonToFromUnitEntity.toMap(homeUnit.unit),
      'singleNotifications': homeUnit.singleNotifications
          .map((e) => JsonToFromSingleNotificationEntity.toMap(e))
          .toList(),
    };
  }

  static HomeUnitEntity fromMap(dynamic json) {
    return HomeUnitEntity(
      id: json['id'],
      residents: json.containsKey('residents')
          ? (json['residents'] as List)
              .map(JsonToFromResidentEntity.fromMap)
              .toList()
          : [],
      vehicles: json.containsKey('vehicles')
          ? (json['vehicles'] as List)
              .map(JsonToFromVehicleEntity.fromMap)
              .toList()
          : [],
      visitors: json.containsKey('visitors')
          ? (json['visitors'] as List)
              .map(JsonToFromVisitorEntity.fromMap)
              .toList()
          : [],
      houseServiceProviders: json.containsKey('houseServiceProviders')
          ? (json['houseServiceProviders'] as List)
              .map(JsonToFromHouseServiceProviderEntity.fromMap)
              .toList()
          : [],
      unit: JsonToFromUnitEntity.fromMap(json['unit']),
      singleNotifications: json.containsKey('singleNotifications')
          ? (json['singleNotifications'] as List)
              .map(JsonToFromSingleNotificationEntity.fromMap)
              .toList()
          : [],
    );
  }
}
