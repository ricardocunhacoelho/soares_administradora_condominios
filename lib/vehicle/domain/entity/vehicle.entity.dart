class VehicleEntity {
  final String id;
  final String color;
  final String plate;
  final String model;
  final int year;
  final EVehicleType vehicleType;
  VehicleEntity({
    required this.id,
    required this.color,
    required this.plate,
    required this.model,
    required this.year,
    required this.vehicleType,
  });
}

enum EVehicleType { car, motorbike }
