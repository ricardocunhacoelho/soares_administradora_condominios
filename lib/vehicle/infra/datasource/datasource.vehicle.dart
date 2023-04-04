abstract class IVehicleDataSource {
  Future<void> registerVehicle(Map<String, dynamic> vehicleMap, String idUnit);

  Future<void> updateValueVehicle(Map<String, dynamic> mapVehicle, int index);

  Future<void> deleteVehicle(String idUnit, String plate, int index);
}
