import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/adapters/json.to.from.news.wall.dart';

void main() {
  test('deve converter um News em map ', () {
    final newsEntity = NewsEntity(
      id: 'idtransformarmap',
      author: 'idtransformarmap',
      title: 'vermelho',
      text: '8KB3',
      image: 'sedan',
      date: DateTime.now(),
    );
    final map = JsonToFromNewsEntity.toMap(newsEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um News', () {
    final newsEntity = JsonToFromNewsEntity.fromMap({
      'id': 'idvehicle',
      'title': 'vermelho',
      'text': 'vermelho',
      'author': '8KB3',
      'date': '2022-04-21 21:30:00',
    });
    expect(newsEntity, isA<NewsEntity>());
  });
}
