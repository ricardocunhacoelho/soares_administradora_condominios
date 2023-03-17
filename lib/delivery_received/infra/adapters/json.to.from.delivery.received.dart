import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/unit/infra/adapters/json.to.from.unit.entity.dart';

class JsonToFromDeliveryReceivedEntity {
  static Map<String, dynamic> toMap(
      DeliveryReceivedEntity deliveryReceivedEntity) {
    return {
      'id': deliveryReceivedEntity.id,
      'qrid': deliveryReceivedEntity.qrid,
      'unit': JsonToFromUnitEntity.toMap(deliveryReceivedEntity.unit),
      'status': deliveryReceivedEntity.receiptStatus.name,
      'residentNameDestiny': deliveryReceivedEntity.residentNameDestiny,
      'whoTookItName': deliveryReceivedEntity.whoTookItName,
      'packagePicture': deliveryReceivedEntity.packagePicture,
      'arrivalCondominiumDate': deliveryReceivedEntity.arrivalCondominiumDate.toIso8601String(),
      'withdrawnDateResident': deliveryReceivedEntity.withdrawnDateResident.toIso8601String(),
    };
  }

  static DeliveryReceivedEntity fromMap(dynamic json) {
    return DeliveryReceivedEntity(
        id: json['id'],
        qrid: json['qrid'],
        unit: JsonToFromUnitEntity.fromMap(json['unit']),
        receiptStatus: EReceiptStatus.values.firstWhere(
          (element) => element.name == json['receiptStatus'],
        ),
        residentNameDestiny: json['residentNameDestiny'],
        whoTookItName: json['whoTookItName'],
        packagePicture: json['packagePicture'],
        arrivalCondominiumDate: DateTime.parse(json['arrivalCondominiumDate']),
        withdrawnDateResident: DateTime.parse(json['withdrawnDateResident']));      
  }
}
