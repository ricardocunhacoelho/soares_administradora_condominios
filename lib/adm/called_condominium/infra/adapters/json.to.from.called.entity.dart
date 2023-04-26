import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';

class JsonToFromCalledEntity {
  static Map<String, dynamic> toMap(CalledEntity called) {
    return {
      'id': called.id,
      'about': called.about,
      'message': called.message,
      'residentId': called.residentId,
      'unitId': called.unitId,
      'sectorDestiny': called.sectorDestiny.name,
      'dateSend': called.dateSend.toIso8601String(),
      'dateSeen': called.dateSeen.toIso8601String(),
      'seen': called.seen,
    };
  }

  static CalledEntity fromMap(dynamic json) {
    return CalledEntity(
      id: json['id'],
      about: json['about'],
      message: json['message'],
      residentId: json['residentId'],
      unitId: json['unitId'],
      sectorDestiny: ESectorDestiny.values.firstWhere(
        (element) => element.name == json['sectorDestiny'],
      ),
      dateSend: DateTime.parse(json['dateSend']),
      dateSeen: DateTime.parse(json['dateSeen']),
      seen: json['seen'],
    );
  }
}
