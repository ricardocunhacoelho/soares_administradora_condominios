import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';
import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';
import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';

class HomeUnitRepository implements IHomeUnitRepository {
  final IHomeUnitDataSource homeUnitDataSource;
  HomeUnitRepository(this.homeUnitDataSource);

  @override
  Stream<HomeUnitEntity> fetchHomeUnit(String id) {
    final streamMap = homeUnitDataSource.fetchHomeUnit(id);
    return streamMap.map(_convert);
  }

  HomeUnitEntity _convert(Map<dynamic, dynamic> map) {
    return JsonToFromHomeUnitEntity.fromMap(map);
  }
}
