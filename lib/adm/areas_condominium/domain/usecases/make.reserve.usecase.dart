
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/irepositories/irepository.area.condominium.dart';

abstract class IMakeReserve{
  Future<void> call(ReserveEntity reserve, String uid);
}
class MakeReserve implements IMakeReserve {
  final IAreaCondominiumRepository repository;

  MakeReserve(this.repository);
  @override
  Future<void> call(ReserveEntity reserve, String uid) async {
    await repository.makeReserve(reserve, uid);
  }
}
