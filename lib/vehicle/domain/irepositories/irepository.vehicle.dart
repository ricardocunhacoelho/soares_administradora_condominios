import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

abstract class IVehicleRepository {
  Future<void> registerVehicle(VehicleEntity vehicle, String idUnit);

  Future<void> updateValueVehicle(VehicleEntity vehicleEntity, int index);

  Future<void> deleteVehicle(String idUnit, String plate, int index);
}
