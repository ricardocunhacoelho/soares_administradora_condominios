
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/irepositories/irepository.lost.found.dart';

abstract class IGetAllLostFound {
  Stream<List<LostFoundEntity>> call();
}

class GetAllLostFound implements IGetAllLostFound {
  final ILostFoundRepository repository;

  GetAllLostFound(this.repository);
  @override
  Stream<List<LostFoundEntity>> call()  {
    return repository.getAllLostFound();
  }
}