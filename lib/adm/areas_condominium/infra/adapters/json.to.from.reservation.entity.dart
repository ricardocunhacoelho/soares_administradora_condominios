import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.area.condominium.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';

class JsonToFromReserveEntity {
  static Map<String, dynamic> toMap(ReserveEntity reserve) {
    return {
      'id': reserve.id,
      'motivation': reserve.motivation,
      'price': reserve.price,
      'residentUid': reserve.residentUid,
      'areaCondominium':
          JsonToFromAreaCondominiumEntity.toMap(reserve.areaCondominium),
      'reservationDate': reserve.reservationDate.toIso8601String(),
      'numberOfGuests': reserve.numberOfGuests,
      'paidOut': reserve.paidOut,
    };
  }

  static ReserveEntity fromMap(dynamic json) {
    return ReserveEntity(
      id: json['id'],
      price: json['price'],
      motivation: json['motivation'],
      residentUid: json['residentUid'],
      areaCondominium:
          JsonToFromAreaCondominiumEntity.fromMap(json['areaCondominium']),
      reservationDate: DateTime.parse(json['reservationDate']),
      numberOfGuests: json['numberOfGuests'] ?? 0,
      paidOut: json['paidOut'],
    );
  }
}
