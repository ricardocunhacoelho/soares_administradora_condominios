import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';

abstract class IHomeUnitRepository {

  Future<AuthResult> authenticateHomeUnit(String email, String pass);

  Stream<HomeUnitEntity> fetchHomeUnit(String uid);
  
}
