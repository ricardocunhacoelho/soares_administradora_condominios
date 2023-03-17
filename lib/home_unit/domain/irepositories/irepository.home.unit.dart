import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class IHomeUnitRepository {

  Future<void> authenticateHomeUnit(String email, String pass);

  Stream<HomeUnitEntity> fetchHomeUnit(String uid);
  
}
