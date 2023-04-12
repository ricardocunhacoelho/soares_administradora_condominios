
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel({
    required String id,
    required String color,
    required String plate,
    required String model,
    required int year,
    required EVehicleType vehicleType
  }) : super(
          id: id,
          color: color,
          plate: plate,
          model: model,
          year: year,
          vehicleType: vehicleType,
        );

  factory VehicleModel.empty() => VehicleModel(
        id: '',
        color: '',
        plate: '',
        model: '',
        year: 0,
        vehicleType: EVehicleType.car,
      );
  VehicleModel copyWith({
    String? id,
    String? color,
    String? plate,
    String? model,
    int? year,
    EVehicleType? vehicleType
  }) {
    return VehicleModel(
      id: id ?? this.id,
      color: color ?? this.color,
      plate: plate ?? this.plate,
      model: model ?? this.model,
      year: year ?? this.year,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }

  factory VehicleModel.converter(VehicleEntity vehicle) => VehicleModel(
        id: vehicle.id,
        color: vehicle.color,
        plate: vehicle.plate,
        model: vehicle.model,
        year: vehicle.year,
        vehicleType: vehicle.vehicleType,
      );
}
