import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/adapters/json.to.from.lost.found.entity.dart';

void main() {
  test('deve converter um LostFound em map ', () {
    final lostFoundEntity = LostFoundEntity(
      id: 'idtransformarmap',
      title: 'vermelho',
      details: '8KB3',
      image: 'sedan',
      foundDate: DateTime.now(),
    );
    final map = JsonToFromLostFoundEntity.toMap(lostFoundEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um LostFound', () {
    final lostFoundEntity = JsonToFromLostFoundEntity.fromMap({
      'id': 'idvehicle',
      'title': 'vermelho',
      'details': '8KB3',
      'image': 'sedan',
      'foundDate': '2022-04-21 21:30:00',
    });
    expect(lostFoundEntity, isA<LostFoundEntity>());
  });
}
