import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

class JsonToFromVehicleEntity {
  static Map<String, dynamic> toMap(VehicleEntity vehicleEntity) {
    return {
      'id': vehicleEntity.id,
      'color': vehicleEntity.color,
      'plate': vehicleEntity.plate,
      'model': vehicleEntity.model,
      'year': vehicleEntity.year,
    };
  }

  static VehicleEntity fromMap(dynamic json) {
    return VehicleEntity(
      id: json['id'],
      color: json['color'],
      plate: json['plate'],
      model: json['model'],
      year: json['year'],
    );
  }
}
