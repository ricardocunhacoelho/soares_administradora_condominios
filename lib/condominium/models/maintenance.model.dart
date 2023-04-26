import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';

class MaintenanceModel extends MaintenanceEntity {
  MaintenanceModel({
    required String id,
    required String observation,
    required String residentId,
    required String unitId,
    required DateTime dateSend,
    required DateTime dateSeen,
    required bool seen,
    required String image,
  }) : super(
            id: id,
            observation: observation,
            residentId: residentId,
            unitId: unitId,
            dateSend: dateSend,
            dateSeen: dateSeen,
            seen: seen,
            image: image);

  factory MaintenanceModel.empty() => MaintenanceModel(
        id: '',
        observation: '',
        residentId: '',
        unitId: '',
        dateSend: DateTime(0, 0, 0),
        dateSeen: DateTime(0, 0, 0),
        seen: false,
        image: '',
      );
  MaintenanceModel copyWith({
    String? id,
    String? observation,
    String? residentId,
    String? unitId,
    DateTime? dateSend,
    DateTime? dateSeen,
    bool? seen,
    String? image,
  }) {
    return MaintenanceModel(
        id: id ?? this.id,
        observation: observation ?? this.observation,
        residentId: residentId ?? this.residentId,
        unitId: unitId ?? this.unitId,
        dateSend: dateSend ?? this.dateSend,
        dateSeen: dateSeen ?? this.dateSeen,
        seen: seen ?? this.seen,
        image: image ?? this.image);
  }

  factory MaintenanceModel.converter(MaintenanceEntity maintenance) =>
      MaintenanceModel(
        id: maintenance.id,
        observation: maintenance.observation,
        residentId: maintenance.residentId,
        unitId: maintenance.unitId,
        dateSend: maintenance.dateSend,
        dateSeen: maintenance.dateSeen,
        seen: maintenance.seen,
        image: maintenance.image,
      );
}
