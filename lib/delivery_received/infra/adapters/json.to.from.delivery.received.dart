import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/resident/infra/adapters/json.to.from.resident.entity.dart';

class JsonToFromDeliveryReceivedEntity {
  static Map<String, dynamic> toMap(
      DeliveryReceivedEntity deliveryReceivedEntity) {
    return {
      'id': deliveryReceivedEntity.id,
      'receiver':
          JsonToFromResidentEntity.toMap(deliveryReceivedEntity.receiver),
      'receiptStatus': deliveryReceivedEntity.receiptStatus.name,
      'packagePicture': deliveryReceivedEntity.id,
      'arrivalCondominiumDate':
          deliveryReceivedEntity.arrivalCondominiumDate.toIso8601String(),
      'withdrawnDateResident':
          deliveryReceivedEntity.withdrawnDateResident.toIso8601String(),
      'anyReceiver': deliveryReceivedEntity.id,
      'whoTookItName': deliveryReceivedEntity.id,
    };
  }

  static DeliveryReceivedEntity fromMap(dynamic json) {
    return DeliveryReceivedEntity(
      id: json['id'],
      receiver: JsonToFromResidentEntity.fromMap(json['receiver']),
      receiptStatus: EReceiptStatus.values.firstWhere(
        (element) => element.name == json['receiptStatus'],
      ),
      whoTookItName:
          json.containsKey('whoTookItName') ? json['whoTookItName'] : null,
      packagePicture: json['packagePicture'],
      arrivalCondominiumDate: DateTime.parse(json['arrivalCondominiumDate']),
      withdrawnDateResident: DateTime.parse(json['withdrawnDateResident']),
      anyReceiver: json['anyReceiver'],
    );
  }
}
