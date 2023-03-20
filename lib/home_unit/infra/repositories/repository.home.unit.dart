import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/home_unit/domain/irepositories/irepository.home.unit.dart';
import 'package:soares_administradora_condominios/home_unit/infra/adapters/json.to.from.home.unit.adapter.dart';
import 'package:soares_administradora_condominios/home_unit/infra/datasource/datasource.home.unit.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';

class HomeUnitRepository implements IHomeUnitRepository {
  final IHomeUnitDataSource homeUnitDataSource;
  HomeUnitRepository(this.homeUnitDataSource);

  @override
  Future<AuthResult> authenticateHomeUnit(String email, String pass) async {
    if (_isValidsInputs(email, pass)) {
    return await homeUnitDataSource.authenticateHomeUnit(email, pass);
    }else{
      return AuthResult(msgError: 'Não autenticado, entradas inválidas');
    }
  }
    bool _isValidsInputs(String user, String pass) =>
      user.isNotEmpty && pass.isNotEmpty && pass.length >= 6;

  @override
  Stream<HomeUnitEntity> fetchHomeUnit(String uid) {
    final streamMap = homeUnitDataSource.fetchHomeUnit(uid);
    return streamMap.map(_convert);
  }
    HomeUnitEntity _convert(Map<dynamic, dynamic> map) {
    return JsonToFromHomeUnitEntity.fromMap(map);
  }
}
