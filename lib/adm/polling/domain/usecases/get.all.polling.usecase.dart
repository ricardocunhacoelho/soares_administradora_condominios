import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/irepositories/irepository.polling.dart';


abstract class IGetAllPolling {
  Stream<List<PollingEntity>> call();
}

class GetAllPolling implements IGetAllPolling {
  final IPollingRepository repository;

  GetAllPolling(this.repository);
  @override
  Stream<List<PollingEntity>> call()  {
    return repository.getAllPolling();
  }
}