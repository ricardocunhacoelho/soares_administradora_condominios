
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/irepositories/irepository.vehicle.dart';

abstract class IRegisterVehicle{
  Future<void> call(VehicleEntity vehicle, String idUnit);
}
class RegisterVehicle implements IRegisterVehicle {
  final IVehicleRepository repository;

  RegisterVehicle(this.repository);
  @override
  Future<void> call(VehicleEntity vehicle, String idUnit) async {
    await repository.registerVehicle(vehicle, idUnit);
  }
}