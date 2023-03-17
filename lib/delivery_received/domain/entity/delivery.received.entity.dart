import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class DeliveryReceivedEntity {
  final String id;
  final String qrid;
  final UnitEntity unit;
  final EReceiptStatus receiptStatus;
  final String residentNameDestiny;
  final String whoTookItName;
  final String packagePicture;
  final DateTime arrivalCondominiumDate;
  final DateTime withdrawnDateResident;

  DeliveryReceivedEntity({
    required this.id,
    required this.qrid,
    required this.unit,
    required this.receiptStatus,
    required this.residentNameDestiny,
    required this.whoTookItName,
    required this.packagePicture,
    required this.arrivalCondominiumDate,
    required this.withdrawnDateResident,
  });
}

enum EReceiptStatus { waitingPickUp, complete }
