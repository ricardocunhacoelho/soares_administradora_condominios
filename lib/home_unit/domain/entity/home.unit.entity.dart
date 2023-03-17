
import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

class HomeUnitEntity {
  final String id;
  final String title;
  final List<ResidentEntity> residents;
  final List<VehicleEntity> vehicles;
  final List<VisitorEntity> visitors;
  final List<HouseServiceProviderEntity> houseServiceProviders;
  final List<DeliveryReceivedEntity> deliveriesReceived;
  final UnitEntity unit;
  final String profileImage;
  final List<SingleNotificationEntity> singleNotifications;
  HomeUnitEntity({
    required this.id,
    required this.title,
    required this.residents,
    required this.vehicles,
    required this.visitors,
    required this.houseServiceProviders,
    required this.deliveriesReceived,
    required this.unit,
    required this.profileImage,
    required this.singleNotifications,
  });
}
