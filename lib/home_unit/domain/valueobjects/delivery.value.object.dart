import 'package:soares_administradora_condominios/home_unit/domain/valueobjects/unit.value.object.dart';

class Delivery {
  final String id;
  final Unit unit;
  final EReceiptStatus status;
  Delivery({
    required this.id,
    required this.unit,
    required this.status,
  });
}

enum EReceiptStatus { waitingPickUp, complete }