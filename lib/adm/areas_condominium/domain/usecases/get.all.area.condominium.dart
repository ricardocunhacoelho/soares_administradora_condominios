
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/irepositories/irepository.area.condominium.dart';

abstract class IGetAllAreaCondominium {
  Stream<List<AreaCondominiumEntity>> call();
}

class GetAllAreaCondominium implements IGetAllAreaCondominium {
  final IAreaCondominiumRepository repository;

  GetAllAreaCondominium(this.repository);
  @override
  Stream<List<AreaCondominiumEntity>> call()  {
    return repository.getAllAreaCondominium();
  }
}