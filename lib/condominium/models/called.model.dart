
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';

class CalledModel extends CalledEntity {
  CalledModel({
    required String id,
    required String about,
    required String message,
    required String residentId,
    required String unitId,
    required ESectorDestiny sectorDestiny,
    required DateTime dateSend,
    required DateTime dateSeen,
    required bool seen,
  }) : super(
            id: id,
            about: about,
            message: message,
            residentId: residentId,
            unitId: unitId,
            sectorDestiny: sectorDestiny,
            dateSend: dateSend,
            dateSeen: dateSeen,
            seen: seen);

  factory CalledModel.empty() => CalledModel(
        id: '',
        about: '',
        message: '',
        residentId: '',
        unitId: '',
        sectorDestiny: ESectorDestiny.sindico,
        dateSend: DateTime(0, 0, 0),
        dateSeen: DateTime(0, 0, 0),
        seen: false,
      );
  CalledModel copyWith(
      {String? id,
      String? about,
      String? message,
      String? residentId,
      String? unitId,
      ESectorDestiny? sectorDestiny,
      DateTime? dateSend,
      DateTime? dateSeen,
      bool? seen}) {
    return CalledModel(
        id: id ?? this.id,
        about: about ?? this.about,
        message: message ?? this.message,
        residentId: residentId ?? this.residentId,
        unitId: unitId ?? this.unitId,
        sectorDestiny: sectorDestiny ?? this.sectorDestiny,
        dateSend: dateSend ?? this.dateSend,
        dateSeen: dateSeen ?? this.dateSeen,
        seen: seen ?? this.seen);
  }

  factory CalledModel.converter(CalledEntity called) => CalledModel(
        id: called.id,
        about: called.about,
        message: called.message,
        residentId: called.residentId,
        unitId: called.unitId,
        sectorDestiny: called.sectorDestiny,
        dateSend: called.dateSend,
        dateSeen: called.dateSeen,
        seen: called.seen,
      );
}
