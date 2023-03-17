import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';
import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';

class HomeUnitRepository implements IHomeUnitRepository {
  final IHomeUnitDataSource homeUnitDataSource;
  HomeUnitRepository(this.homeUnitDataSource);

  @override
  Future<void> authenticateHomeUnit(String email, String pass) async {
    await homeUnitDataSource.authenticateHomeUnit(email, pass);
  }

  @override
  Stream<HomeUnitEntity> fetchHomeUnit(String uid) {
    final streamMap = homeUnitDataSource.fetchHomeUnit(uid);
    // final homeUnit = JsonParaUsuarioEntidade.deMap(map);
    throw UnimplementedError();
  }
}
