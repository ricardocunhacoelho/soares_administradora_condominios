
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/irepositories/irepository.vehicle.dart';
import 'package:soares_administradora_condominios/vehicle/infra/adapters/json.to.from.visitor.vehicle.dart';
import 'package:soares_administradora_condominios/vehicle/infra/datasource/datasource.vehicle.dart';

class VehicleRepository implements IVehicleRepository {
  final IVehicleDataSource vehicleDataSource;
  VehicleRepository(this.vehicleDataSource);

  @override
  Future<void> registerVehicle(VehicleEntity vehicle, String idUnit) async {
    final mapVehicle = JsonToFromVehicleEntity.toMap(vehicle);
    await vehicleDataSource.registerVehicle(mapVehicle, idUnit);
  }

  @override
  Future<void> updateValueVehicle(
      VehicleEntity VehicleEntity, int index) async {
    final mapVehicle = JsonToFromVehicleEntity.toMap(VehicleEntity);
    await vehicleDataSource.updateValueVehicle(mapVehicle, index);
  }
  
  @override
  Future<void> deleteVehicle(String idUnit, String plate, int index) async {
    await vehicleDataSource.deleteVehicle(idUnit ,plate, index);
  }
}
