import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class IHomeUnitDataSource {
  Stream<HomeUnitEntity> fetchHomeUnit(String uid);
  Future<void> authenticateHomeUnit(String email, String pass);
}
