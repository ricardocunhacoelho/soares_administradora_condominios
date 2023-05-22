
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/irepositories/irepository.area.condominium.dart';

abstract class IFetchArea {
  Stream<AreaCondominiumEntity> call(String id);
}

class FetchArea implements IFetchArea {
  final IAreaCondominiumRepository repository;

  FetchArea(this.repository);
  @override
  Stream<AreaCondominiumEntity> call(String id)  {
    return repository.fetchArea(id);
  }
}