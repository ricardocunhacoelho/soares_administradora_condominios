import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/delivery_received/infra/adapters/json.to.from.delivery.received.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

void main() {
  test('deve converter um DeliveryReceivedEntity em map ', () {
    final deliveryReceivedEntity = DeliveryReceivedEntity(
        id: 'id',
        qrid: 'qrid',
        unit: UnitEntity(id: 'id', qrid: 'qrid', block: 'block', number: 2),
        receiptStatus: EReceiptStatus.waitingPickUp,
        residentNameDestiny: 'residentNameDestiny',
        whoTookItName: 'whoTookItName',
        packagePicture: 'packagePicture',
        arrivalCondominiumDate: DateTime.now(),
        withdrawnDateResident: DateTime.now());

    final map = JsonToFromDeliveryReceivedEntity.toMap(deliveryReceivedEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um DeliveryReceivedEntity', () {
    final deliveryReceivedEntity = JsonToFromDeliveryReceivedEntity.fromMap({
      'id': 'id',
      'qrid': 'qrid',
      'unit': {'id': 'id', 'qrid': 'qrid', 'block': 'block', 'number': 2},
      'receiptStatus': 'waitingPickUp',
      'residentNameDestiny': 'residentNameDestiny',
      'whoTookItName': 'whoTookItName',
      'packagePicture': 'packagePicture',
      'arrivalCondominiumDate': '2022-04-21 21:30:00',
      'withdrawnDateResident': '2022-04-21 21:30:00'
    });
    expect(deliveryReceivedEntity, isA<DeliveryReceivedEntity>());
  });
}
