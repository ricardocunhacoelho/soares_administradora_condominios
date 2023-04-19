
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';

abstract class ICalendarCondominiumRepository {
  Stream<List<TaskCondominiumEntity>> getAllTaskCondominium();
}
