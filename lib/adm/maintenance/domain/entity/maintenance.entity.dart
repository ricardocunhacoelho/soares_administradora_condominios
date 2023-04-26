
class MaintenanceEntity {
  final String id;
  final String observation;
  final String residentId;
  final String unitId;
  final DateTime dateSend;
  final DateTime dateSeen;
  final bool seen;
  final String image;

  MaintenanceEntity({
    required this.id,
    required this.observation,
    required this.residentId,
    required this.unitId,
    required this.dateSend,
    required this.dateSeen,
    required this.seen,
    required this.image,
  });
}