
import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';

class JsonToFromMaintenanceEntity {
  static Map<String, dynamic> toMap(MaintenanceEntity maintenance) {
    return {
      'id': maintenance.id,
      'observation': maintenance.observation,
      'residentId': maintenance.residentId,
      'unitId': maintenance.unitId,
      'dateSend': maintenance.dateSend.toIso8601String(),
      'dateSeen': maintenance.dateSeen.toIso8601String(),
      'seen': maintenance.seen,
      'image': maintenance.image,
    };
  }

  static MaintenanceEntity fromMap(dynamic json) {
    return MaintenanceEntity(
      id: json['id'],
      observation: json['message'],
      residentId: json['residentId'],
      unitId: json['unitId'],
      dateSend: DateTime.parse(json['dateSend']),
      dateSeen: DateTime.parse(json['dateSeen']),
      seen: json['seen'],
      image: json['image'],
    );
  }
}
