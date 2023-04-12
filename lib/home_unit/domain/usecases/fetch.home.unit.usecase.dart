import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';

abstract class IFetchHomeUnit {
  Stream<HomeUnitEntity> call(String uid);
}

class FetchHomeUnit implements IFetchHomeUnit {
  final IHomeUnitRepository repository;

  FetchHomeUnit(this.repository);
  @override
  Stream<HomeUnitEntity> call(String uid)  {
    return repository.fetchHomeUnit(uid);
  }
}