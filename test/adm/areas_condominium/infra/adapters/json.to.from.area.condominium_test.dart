import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.area.condominium.dart';

void main() {
  test('deve converter um AreaCondominium em map ', () {
    final areaCondominiumEntity = AreaCondominiumEntity(
      id: 'id',
      title: 'about',
      rules: ['nao fazeraquilo','naofazerisso', 'fazerisso'],
      description: 'Piscina de 8 metros',
      numberOfPeople: 40,
      price: 250.00,
      reserveDateList: [],
      carouselImage: ['piscinalinda'],
    );
    final map = JsonToFromAreaCondominiumEntity.toMap(areaCondominiumEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um AreaCondominium', () {
    final areaCondominiumEntity = JsonToFromAreaCondominiumEntity.fromMap({
      'id': 'idvehicle',
      'title': 'title',
      'rules': ['nao fazeraquilo','naofazerisso', 'fazerisso'],
      'description': 'Piscina de 8 metros',
      'numberOfPeople': 40,
      'price': 250,
      'reserveDateList': ['2022-04-21 21:30:00'],
      'carouselImage': ['piscinalinda'],
    });
    print(areaCondominiumEntity.reserveDateList[0].day);
    expect(areaCondominiumEntity, isA<AreaCondominiumEntity>());
  });
}