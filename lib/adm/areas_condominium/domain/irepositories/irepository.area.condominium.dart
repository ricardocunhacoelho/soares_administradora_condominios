
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';

abstract class IAreaCondominiumRepository {
  Stream<List<AreaCondominiumEntity>> getAllAreaCondominium();

  Stream<AreaCondominiumEntity> fetchArea(String id);

  Future<void> makeReserve(ReserveEntity reserve, String uid);
  
}
