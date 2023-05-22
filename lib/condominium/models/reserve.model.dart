import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';

class ReserveModel extends ReserveEntity {
  ReserveModel({
    required String id,
    required String motivation,
    required String residentUid,
    required double price,
    required AreaCondominiumEntity areaCondominium,
    required DateTime reservationDate,
    required int numberOfGuests,
    required bool paidOut,
  }) : super(
          id: id,
          motivation: motivation,
          price: price,
          residentUid: residentUid,
          areaCondominium: areaCondominium,
          reservationDate: reservationDate,
          numberOfGuests: numberOfGuests,
          paidOut: paidOut,
        );

  factory ReserveModel.empty() => ReserveModel(
        id: '',
        motivation: '',
        residentUid: '',
        areaCondominium: AreaCondominiumEntity(
            id: 'id',
            title: 'title',
            rules: ['vazio'],
            description: 'description',
            numberOfPeople: 0,
            price: 0,
            reserveDateList: [],
            carouselImage: []),
        reservationDate: DateTime(0, 0, 0),
        numberOfGuests: 0,
        price: 0,
        paidOut: false,
      );
  ReserveModel copyWith({
    String? id,
    String? motivation,
    String? residentUid,
    AreaCondominiumEntity? areaCondominium,
    DateTime? reservationDate,
    int? numberOfGuests,
    bool? paidOut,
    double? price,
  }) {
    return ReserveModel(
      id: id ?? this.id,
      motivation: motivation ?? this.motivation,
      residentUid: residentUid ?? this.residentUid,
      areaCondominium: areaCondominium ?? this.areaCondominium,
      reservationDate: reservationDate ?? this.reservationDate,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      paidOut: paidOut ?? this.paidOut,
      price: price ?? this.price,
    );
  }

  factory ReserveModel.converter(ReserveEntity reserve) => ReserveModel(
        id: reserve.id,
        motivation: reserve.motivation,
        residentUid: reserve.residentUid,
        areaCondominium: reserve.areaCondominium,
        reservationDate: reserve.reservationDate,
        numberOfGuests: reserve.numberOfGuests,
        paidOut: reserve.paidOut,
        price: reserve.price,
      );
}
