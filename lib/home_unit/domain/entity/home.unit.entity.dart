import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class HomeUnitEntity {
  final String id;
  final List<ResidentEntity> residents;
  final List<VehicleEntity> vehicles;
  final List<VisitorEntity> visitors;
  final List<HouseServiceProviderEntity> houseServiceProviders;
  final UnitEntity unit;
  final List<SingleNotificationEntity> singleNotifications;
  HomeUnitEntity({
    required this.id,
    required this.residents,
    required this.vehicles,
    required this.visitors,
    required this.houseServiceProviders,
    required this.unit,
    required this.singleNotifications,
  });
}
