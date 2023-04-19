import 'package:flutter_test/flutter_test.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/adapters/json.to.from.task.entity.dart';

void main() {
  test('deve converter um Task em map ', () async {
    final requestAccessEntity = TaskCondominiumEntity(
        id: 'id',
        title: 'title',
        details: 'details',
        startTaskDate: DateTime.now(),
        endTaskDate: DateTime(2023, 05, 12));
    final map = JsonToFromTaskCondominiumEntity.toMap(requestAccessEntity);
    expect(map, isA<Map>());
  });
  test('deve converter um map em um RequestAccessEntity', () {
    final taskCondominiumEntity =
        JsonToFromTaskCondominiumEntity.fromMap({
      'id': 'id',
      'title': 'title',
      'details': 'details',
      'startTaskDate': '2022-04-21 21:30:00',
      'endTaskDate': '2022-04-21 21:30:00',
    });
    expect(taskCondominiumEntity, isA<TaskCondominiumEntity>());
  });
}
