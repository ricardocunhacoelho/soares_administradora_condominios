
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';

class ReserveEntity {
  final String id;
  final String motivation;
  final String residentUid;
  final double price;
  final AreaCondominiumEntity areaCondominium;
  final DateTime reservationDate;
  final int numberOfGuests;
  final bool paidOut;

  ReserveEntity({
    required this.id,
    required this.motivation,
    required this.residentUid,
    required this.price,
    required this.areaCondominium,
    required this.reservationDate,
    required this.numberOfGuests,
    required this.paidOut,
  });
}