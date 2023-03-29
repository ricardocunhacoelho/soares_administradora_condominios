import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

class DeliveryReceivedEntity {
  final String id;
  final ResidentEntity receiver;
  final EReceiptStatus receiptStatus;
  final String packagePicture;
  final DateTime arrivalCondominiumDate;
  final DateTime withdrawnDateResident;
  final bool anyReceiver;
  final String? whoTookItName;

  DeliveryReceivedEntity({
    required this.id,
    required this.receiver,
    required this.receiptStatus,
    required this.packagePicture,
    required this.arrivalCondominiumDate,
    required this.withdrawnDateResident,
    required this.anyReceiver,
    required this.whoTookItName,
  });
}

enum EReceiptStatus { waitingPickUp, complete }
