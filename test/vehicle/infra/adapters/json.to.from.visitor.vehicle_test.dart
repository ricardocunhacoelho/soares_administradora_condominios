import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';
import 'package:soares_administradora_condominios/vehicle/infra/adapters/json.to.from.visitor.vehicle.dart';

void main() {
  test('deve converter um VehicleEntity em map ', () {
    final vehicleEntity = VehicleEntity(
        id: 'idtransformarmap',
        color: 'vermelho',
        plate: '8KB3',
        model: 'sedan',
        year: 10,
        vehicleType: EVehicleType.car);
    final map = JsonToFromVehicleEntity.toMap(vehicleEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um VehicleEntity', () {
    final vehicleEntity = JsonToFromVehicleEntity.fromMap({
      'id': 'idvehicle',
      'color': 'vermelho',
      'plate': '8KB3',
      'model': 'sedan',
      'year': 10,
      'vehicleType': 'car',
    });
    expect(vehicleEntity, isA<VehicleEntity>());
  });
}
