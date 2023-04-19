
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/irepositories/irepository.news.wall.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/adapters/json.to.from.task.entity.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/infra/datasource/datasource.calendar.consominium.dart';

class CalendarCondominiumRepository implements ICalendarCondominiumRepository {
  final ICalendarCondominiumDataSource calendarCondominiumDataSource;
  CalendarCondominiumRepository(this.calendarCondominiumDataSource);

  @override
  Stream<List<TaskCondominiumEntity>> getAllTaskCondominium() {
    final streamList = calendarCondominiumDataSource.getAllTaskCondominium();
    return streamList.map(_convert);
  }

  List<TaskCondominiumEntity> _convert(List<dynamic> list) {
    var test1 = list.map(JsonToFromTaskCondominiumEntity.fromMap).toList();
    return test1;
  }
}
