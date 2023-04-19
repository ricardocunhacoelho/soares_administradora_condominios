
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/irepositories/irepository.news.wall.dart';

abstract class IGetAllTaskCondominium {
  Stream<List<TaskCondominiumEntity>> call();
}

class GetAllTaskCondominium implements IGetAllTaskCondominium {
  final ICalendarCondominiumRepository repository;

  GetAllTaskCondominium(this.repository);
  @override
  Stream<List<TaskCondominiumEntity>> call()  {
    return repository.getAllTaskCondominium();
  }
}