import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/house.service.provider.value.object.dart';
import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/delivery.value.object.dart';
import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/resident.value.object.dart';
import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/unit.value.object.dart';

class HomeUnitEntity {
  final String id;
  final String title;
  final List<Resident> residents;
  final List<Vehicle> vehicles; 
  final List<Visitor> visitors;
  final List<HouseServiceProvider> houseServiceProviders;
  final List<Delivery> deliveries;
  final Unit unit;
  HomeUnitEntity({
    required this.id,
    required this.title,
  });
}
