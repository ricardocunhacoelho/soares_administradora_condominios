import 'package:soares_administradora_condominios/home_unit/domain/entity/home.unit.entity.dart';

abstract class IHomeUnitRepository {

  Stream<HomeUnitEntity> fetchHomeUnit(String id);
  
}
