
import 'package:soares_administradora_condominios/vehicle/domain/irepositories/irepository.vehicle.dart';

abstract class IDeleteVehicle{
  Future<void> call(String idUnit, String plate, int index);
}
class DeleteVehicle implements IDeleteVehicle {
  final IVehicleRepository repository;

  DeleteVehicle(this.repository);
  @override
  Future<void> call(String idUnit, String plate, int index) async {
    await repository.deleteVehicle(idUnit, plate, index);
  }
}
